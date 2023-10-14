module Bot
  module DiscordCommands
    module Sostupid
      extend Discordrb::Commands::CommandContainer
      command(:sostupid, help_available: false) do |event, *args|
        msg = ":sos: :cross: :up: :id:"

        Bot.send_response(event, msg)
      end
    end
  end
end
