# frozen_string_literal: true

module Bot
  module DiscordCommands
    # nuke command
    module Nuke
      extend Discordrb::Commands::CommandContainer
      command(:nuke, description: 'nuke an image') do |event, *_args|
        Bot.process_image(event)
      end
    end
  end
end
