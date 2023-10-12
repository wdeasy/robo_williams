module Bot
  module DiscordCommands
    module Status
      extend Discordrb::Commands::CommandContainer
      command(:status, help_available: false) do |event, *args|

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          case args[0].to_s
          when 'online'
            BOT.online
          when 'idle'
            BOT.idle
          when 'dnd'
            BOT.dnd
          when 'invisible'
            BOT.invisible
          end
        rescue Exception => msg
          Bot.log "Error with the status command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
