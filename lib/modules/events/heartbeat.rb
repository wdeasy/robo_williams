require 'timeout'

module Bot
  module DiscordEvents
    module Heartbeat
      extend Discordrb::EventContainer
      heartbeat do |event|
        next unless BOT.connected?

        begin
          Timeout.timeout(CONFIG.timeout){
            Bot.loop
          }
        rescue Timeout::Error
          Bot.log "Heartbeat did not finish in #{CONFIG.timeout} seconds."
          $heartbeat_in_progress = false
        rescue RuntimeError => e
          Bot.log_exception(e)    
        end
      end
    end
  end
end
