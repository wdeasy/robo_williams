require 'talk_like_a_pirate'

module Bot
  module DiscordCommands
    module Pirate
      extend Discordrb::Commands::CommandContainer
      command(:pirate, description: "Ye be typin like this") do |event, *args|
        msg = TalkLikeAPirate.translate(args.join(" ").strip)

        Bot.send_response(event, msg, event.command.name)
      end
    end
  end
end
