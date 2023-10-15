module Bot
  module DiscordCommands
    module Pashto
      extend Discordrb::Commands::CommandContainer
      command(:pashto, description: "[type like this in Pashto]") do |event, *args|
        Bot.post_response(event, "[#{args.join(" ").strip} in Pashto]")
      end
    end
  end
end
