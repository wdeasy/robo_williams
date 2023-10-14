module Bot
  module DiscordCommands
    module Idiot
      extend Discordrb::Commands::CommandContainer
      command(:idiot, help_available: false) do |event, *args|
        msg = ":id: :information_source: :o2: :cross:"

        Bot.send_response(event, msg)
      end
    end
  end
end
