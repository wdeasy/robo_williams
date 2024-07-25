module Bot
  module DiscordEvents
    module Message
      @messages = DB[:messages].order(Sequel.char_length(:regex).distinct.desc)

      extend Discordrb::EventContainer
      message do |event|

        matches = []
        @messages.each do |msg|
          matches.push(msg) if event.content.downcase.match(Regexp.new(msg[:regex]))
        end

        next if matches.empty?
        match = matches.sample
        Bot.log "#{event.author.username}: #{event.content}"
        msg = nil

        unless match[:file].nil?
          begin
            msg = event.send_file(File.open("data/images/#{match[:file]}",'r'))
          rescue StandardError => e
            Bot.log_exception(e)
          end
        end

        unless match[:text].nil?
          begin
            msg = event.respond(match[:text])
          rescue StandardError => e
            Bot.log_exception(e)
          end
        end

        unless match[:emoji].nil?
          begin
            unless msg.nil?
              msg.react(match[:emoji])
              next
            end

            event.react(match[:emoji]) 
          rescue StandardError => e
            Bot.log_exception(e)
          end
        end

      end
    end
  end
end
