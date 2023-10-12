module Bot
  module DiscordCommands
    module Quit
      extend Discordrb::Commands::CommandContainer
      command(:quit, help_available: false) do |event, *args|
        Bot.log "#{event.author.username}: #{event.content}"
        break unless event.user.id == CONFIG.owner
        unless event.message.channel.pm?
          event.message.delete
        end

        exit 1
      end
    end
  end
end
