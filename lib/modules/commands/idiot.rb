module Bot
  module DiscordCommands
    module Idiot
      extend Discordrb::Commands::CommandContainer
      command(:idiot, help_available: false) do |event, *args|
        msg = ":id: :information_source: :o2: :cross:"

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.send_message(msg)
        rescue Exception => msg
          Bot.log "Error with the idiot command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
