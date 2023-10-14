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

        if !match[:file].nil?
          begin
            msg = event.send_file(File.open("data/images/#{match[:file]}",'r'))
          rescue Exception => e
            Bot.log "Error sending file."
            Bot.log e
          end
        end

        if !match[:text].nil?
          begin
            msg = event.respond(match[:text])
          rescue Exception => e
            Bot.log "Error sending message."
            Bot.log e
          end
        end

        if !match[:emoji].nil?
          begin
            msg.nil? ? event.react(match[:emoji]) : msg.react(match[:emoji])
          rescue Exception => e
            Bot.log "Error adding emoji."
            Bot.log e
          end
        end

      end
    end
  end
end
