module Bot
  module DiscordCommands
    module Jeb
      extend Discordrb::Commands::CommandContainer
      command(:jeb, description: "TYPE:clap:LIKE:clap:THIS") do |event, *args|
        Bot.post_response(event,"**#{args.map(&:upcase).join('**:clap:**').strip}**")
      end
    end
  end
end
