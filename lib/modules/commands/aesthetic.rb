require 'aesthetic'

module Bot
  module DiscordCommands
    module Aesthetic
      extend Discordrb::Commands::CommandContainer
      command(:aesthetic, description: "ｔｙｐｅ ｌｉｋｅ ｔｈｉｓ") do |event, *args|
        msg = args.join(" ").strip.aesthetic

        Bot.send_response(event, msg)
      end
    end
  end
end
