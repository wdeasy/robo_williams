module Bot
  module DiscordCommands
    module Pashto
      extend Discordrb::Commands::CommandContainer
      command(:pashto, description: "[type like this in Pashto]") do |event, *args|
        msg = "[#{args.join(" ").strip} in Pashto]"

        Bot.send_response(event, msg)
      end
    end
  end
end
