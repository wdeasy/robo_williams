# frozen_string_literal: true

require 'aesthetic'

module Bot
  module DiscordCommands
    # Aesthetic command
    module Aesthetic
      extend Discordrb::Commands::CommandContainer
      command(:aesthetic, description: 'ｔｙｐｅ ｌｉｋｅ ｔｈｉｓ') do |event, *args|
        Bot.post_response(event, args.join(' ').strip.aesthetic)
      end
    end
  end
end
