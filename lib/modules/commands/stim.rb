module Bot
  module DiscordCommands
    module Stim
      extend Discordrb::Commands::CommandContainer
      command(:stim, description: "TYPE ߷ LIKE ߷ THIS") do |event, *args|
        Bot.post_response(event, args.map(&:upcase).join(" \u{7F7} ").strip)
      end
    end
  end
end
