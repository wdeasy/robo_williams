module Bot
  module DiscordEvents
    module Disconnected
      extend Discordrb::EventContainer
      disconnected do |event|
        sleep CONFIG.timeout
        next if BOT.connected?

        abort("Still disconnected after #{CONFIG.timeout} seconds.")
      end
    end
  end
end
