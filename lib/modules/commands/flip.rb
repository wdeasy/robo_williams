# frozen_string_literal: true

require 'flippy'

module Bot
  module DiscordCommands
    # Flip command
    module Flip
      extend Discordrb::Commands::CommandContainer
      command(:flip, description: 'sᴉɥʇ əʞᴉl ədʎʇ') do |event, *args|
        Bot.response_message(event, args.join(' ').strip.flip)
      end
    end
  end
end
