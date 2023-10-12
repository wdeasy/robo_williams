module Bot
  module DiscordEvents
    module Message
      extend Discordrb::EventContainer
      message do |event|
        regex = nil

        messages = DB[:messages].order(Sequel.char_length(:regex).distinct.desc)
        messages.each do |msg|
          if event.content.downcase.match(Regexp.new(msg[:regex]))
            regex = msg[:regex]
            break
          end
        end

        unless regex.nil?
          matches = DB[:messages].where(:regex => regex)
          matchIds = matches.map(:id)
          matchId = matchIds.sample
          match = matches.where(:id => matchId).first

          Bot.log "#{event.author.username}: #{event.content}"

          msg = nil

          if !match[:file].nil?
            begin
              msg = event.send_file(File.open("data/images/#{match[:file]}",'r'))
            rescue Exception => msg
              Bot.log "Error sending file."
              Bot.log msg
            end
          end

          if !match[:text].nil?
            begin
              msg = event.respond(match[:text])
            rescue Exception => msg
              Bot.log "Error sending message."
              Bot.log msg
            end
          end

          if !match[:emoji].nil?
            begin
              if !msg.nil?
                msg.react(match[:emoji])
                return
              end

              event.react(match[:emoji])
            rescue Exception => msg
              Bot.log "Error adding emoji."
              Bot.log msg
            end
          end
        end
      end
    end
  end
end
