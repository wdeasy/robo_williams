module Bot
  module DiscordCommands
    module Pashto
      extend Discordrb::Commands::CommandContainer
      command(:pashto, description: "[type like this in Pashto]") do |event, *args|
        words = ''
        args.each do |arg|
          words += "#{arg} "
        end
        msg = "[#{words}in Pashto]"

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.channel.split_send(msg)
        rescue Exception => msg
          Bot.log "Error with the pashto command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
