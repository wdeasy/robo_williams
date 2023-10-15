require 'flippy'

module Bot
  module DiscordCommands
    module Flip
      extend Discordrb::Commands::CommandContainer
      command(:flip, description: "sᴉɥʇ əʞᴉl ədʎʇ") do |event, *args|
        Bot.post_response(event, args.join(" ").strip.flip)
      end
    end
  end
end
