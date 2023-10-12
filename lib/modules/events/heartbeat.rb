require 'timeout'

module Bot
  module DiscordEvents
    module Heartbeat
      extend Discordrb::EventContainer
      heartbeat do |event|
        begin
          Timeout.timeout(CONFIG.timeout){
            Bot.loop
          }
        rescue Timeout::Error
          Bot.log "Heartbeat did not finish in #{CONFIG.timeout} seconds."
          $heartbeat_in_progress = false
        end
      end
    end
  end
end
