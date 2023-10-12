require 'active_support/time'
require 'date'
require 'time'

module Bot
  module DiscordEvents
    # This event is processed each time the bot succesfully connects to discord.
    module Ready
      extend Discordrb::EventContainer
      ready do |event|
        if $recount == 0
          #last_motd
          $last_motd = Date.today

          $heartbeat_in_progress = false
        end

        $recount+=1
        Bot.log "I've powered up, get my program set. (#{$recount})"
        BOT.stream("Hot Piss", "https://www.twitch.tv/15secondgaming")
        $heartbeat_in_progress = false
      end
    end
  end
end
