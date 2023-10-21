module Bot
  module DiscordEvents
    module Message
      extend Discordrb::EventContainer
      message do |event|
        regex = nil

        matches = []
        messages = DB[:messages].order(Sequel.char_length(:regex).distinct.desc)
        messages.each do |msg|
          matches.push(msg) if event.content.downcase.match(Regexp.new(msg[:regex]))
        end

        next if matches.empty?

        match = matches.sample

        Bot.log "#{event.author.username}: #{event.content}"

        msg = nil

        unless match[:file].nil?
          begin
            msg = event.send_file(File.open("data/images/#{match[:file]}",'r'))
          rescue Exception => e
            Bot.log_exception(e)
          end
        end

        unless match[:text].nil?
          begin
            msg = event.respond(match[:text])
          rescue Exception => e
            Bot.log_exception(e)
          end
        end

        unless match[:emoji].nil?
          begin
            msg.nil? ? event.react(match[:emoji]) : msg.react(match[:emoji])
          rescue Exception => e
            Bot.log_exception(e)
          end
        end

      end
    end
  end
end
