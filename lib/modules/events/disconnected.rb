module Bot
  module DiscordEvents
    module Disconnected
      extend Discordrb::EventContainer
      disconnected do |event|
        Bot.log "==> DISCONNECTED <=="

        sleep CONFIG.timeout
        next if BOT.connected?

        Bot.log "Still disconnected after #{CONFIG.timeout} seconds. Restarting."
        exit 0
      end
    end
  end
end
