require 'flippy'

module Bot
  module DiscordCommands
    module Flip
      extend Discordrb::Commands::CommandContainer
      command(:flip, description: "sᴉɥʇ əʞᴉl ədʎʇ") do |event, *args|
        msg = args.join(" ").strip.flip

        Bot.send_response(event, msg, event.command.name)
      end
    end
  end
end
