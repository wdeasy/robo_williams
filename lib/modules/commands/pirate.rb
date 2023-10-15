require 'talk_like_a_pirate'

module Bot
  module DiscordCommands
    module Pirate
      extend Discordrb::Commands::CommandContainer
      command(:pirate, description: "Ye be typin like this") do |event, *args|
        Bot.post_response(event, TalkLikeAPirate.translate(args.join(" ").strip))
      end
    end
  end
end
