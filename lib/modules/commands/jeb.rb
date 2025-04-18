# frozen_string_literal: true

module Bot
  module DiscordCommands
    # Jeb command
    module Jeb
      extend Discordrb::Commands::CommandContainer
      command(:jeb, description: 'TYPE:clap:LIKE:clap:THIS') do |event, *args|
        Bot.response_message(event, "**#{args.map(&:upcase).join('**:clap:**').strip}**")
      end
    end
  end
end
