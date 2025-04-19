# frozen_string_literal: true

module Bot
  module DiscordCommands
    # HLDJ command
    module HLDJ
      extend Discordrb::Commands::CommandContainer
      command(:hldj, description: 'Play audio in your current voice channel') do |event, *args|
        Bot.play_audio(event, args[0])
      end
    end
  end
end
