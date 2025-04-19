# frozen_string_literal: true

module Bot
  module DiscordCommands
    # Quit command
    module Quit
      extend Discordrb::Commands::CommandContainer
      command(:quit, help_available: false) do |event, *_args|
        next unless event.user.id == CONFIG[:owner]

        Bot.log_command(event)
        exit
      end
    end
  end
end
