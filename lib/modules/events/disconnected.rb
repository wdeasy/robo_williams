# frozen_string_literal: true

module Bot
  module DiscordEvents
    # Disconnected events
    module Disconnected
      extend Discordrb::EventContainer
      disconnected do |_event|
        sleep CONFIG[:timeout]
        next if BOT.connected?

        abort("Still disconnected after #{CONFIG[:timeout]} seconds.")
      end
    end
  end
end
