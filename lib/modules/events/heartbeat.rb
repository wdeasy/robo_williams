# frozen_string_literal: true

module Bot
  module DiscordEvents
    # Heartbeat events
    module Heartbeat
      @heartbeat_in_progress = false

      extend Discordrb::EventContainer
      heartbeat do |_event|
        next unless BOT.connected? && @heartbeat_in_progress == false

        @heartbeat_in_progress = true

        begin
          Timeout.timeout(CONFIG[:timeout]) do
            Bot.loop
          end
        rescue Timeout::Error
          Bot.log "Heartbeat did not finish in #{CONFIG[:timeout]} seconds."
        end

        @heartbeat_in_progress = false
      end
    end
  end
end
