require 'aesthetic'

module Bot
  module DiscordCommands
    module Aesthetic
      extend Discordrb::Commands::CommandContainer
      command(:aesthetic, description: "ｔｙｐｅ ｌｉｋｅ ｔｈｉｓ") do |event, *args|
        words = ''
        args.each do |arg|
          words += "#{arg} "
        end
        msg = words.strip.aesthetic

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.channel.split_send(msg)
        rescue Exception => msg
          Bot.log "Error with the aesthetic command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
