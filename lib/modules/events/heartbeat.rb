require 'timeout'

module Bot
  module DiscordEvents
    module Heartbeat
      extend Discordrb::EventContainer
      heartbeat do |event|
        next unless BOT.connected?

        @heartbeat_in_progress = true

        begin
          Timeout.timeout(CONFIG.timeout){
            Bot.loop
          }
        rescue Timeout::Error
          Bot.log "Heartbeat did not finish in #{CONFIG.timeout} seconds."
        rescue RuntimeError => e
          Bot.log_exception(e)    
        end

        @heartbeat_in_progress = false
      end
    end
  end
end
