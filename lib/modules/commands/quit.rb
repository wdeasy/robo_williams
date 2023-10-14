module Bot
  module DiscordCommands
    module Quit
      extend Discordrb::Commands::CommandContainer
      command(:quit, help_available: false) do |event, *args|
        Bot.log "#{event.author.username}: #{event.content}"
        next unless event.user.id == CONFIG.owner

        event.message.delete unless event.message.channel.pm?

        exit 1
      end
    end
  end
end
