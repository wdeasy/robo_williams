module Bot
  module DiscordCommands
    module Jeb
      extend Discordrb::Commands::CommandContainer
      command(:jeb, description: "TYPE:clap:LIKE:clap:THIS") do |event, *args|
        msg = "**#{args.map(&:upcase).join(':clap:').strip}**"

        Bot.send_response(event, msg)
      end
    end
  end
end
