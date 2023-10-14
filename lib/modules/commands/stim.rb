module Bot
  module DiscordCommands
    module Stim
      extend Discordrb::Commands::CommandContainer
      command(:stim, description: "TYPE ߷ LIKE ߷ THIS") do |event, *args|
        msg = args.map(&:upcase).join(" \u{7F7} ").strip

        Bot.send_response(event, msg, event.command.name)
      end
    end
  end
end
