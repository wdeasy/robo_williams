require 'leetspeak'

module Bot
  module DiscordCommands
    module Leet
      extend Discordrb::Commands::CommandContainer
      command(:leet, description: "7A1k 1Ik3 7Hi5") do |event, *args|
        Bot.post_response(event, args.join(" ").strip.leet)
      end
    end
  end
end
