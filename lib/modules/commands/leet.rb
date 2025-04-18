# frozen_string_literal: true

require 'leetspeak'

module Bot
  module DiscordCommands
    # 1337 command
    module Leet
      extend Discordrb::Commands::CommandContainer
      command(:leet, description: '7A1k 1Ik3 7Hi5') do |event, *args|
        Bot.response_message(event, args.join(' ').strip.leet)
      end
    end
  end
end
