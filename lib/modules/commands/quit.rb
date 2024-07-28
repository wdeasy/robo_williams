# frozen_string_literal: true

module Bot
  module DiscordCommands
    # Quit command
    module Quit
      extend Discordrb::Commands::CommandContainer
      command(:quit, help_available: false) do |event, *_args|
        Bot.log "#{event.author.username}: #{event.content}"
        next unless event.user.id == CONFIG.owner

        event.message.delete unless event.message.channel.pm?

        exit
      end
    end
  end
end
