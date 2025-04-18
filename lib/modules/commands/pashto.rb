# frozen_string_literal: true

module Bot
  module DiscordCommands
    # Pashto command
    module Pashto
      extend Discordrb::Commands::CommandContainer
      command(:pashto, description: '[type like this in Pashto]') do |event, *args|
        Bot.response_message(event, "[#{args.join(' ').strip} in Pashto]")
      end
    end
  end
end
