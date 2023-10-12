module Bot
  module DiscordCommands
    module Sostupid
      extend Discordrb::Commands::CommandContainer
      command(:sostupid, help_available: false) do |event, *args|
        msg = ":sos: :cross: :up: :id:"

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.send_message(msg)
        rescue Exception => msg
          Bot.log "Error with the sostupid command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
