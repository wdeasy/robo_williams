require 'date'
require 'time'

module Bot
  module DiscordEvents
    module Ready
      extend Discordrb::EventContainer
      ready do |event|

        @recount = 0 unless @recount 
        @recount+=1

        Bot.log "I've powered up, get my program set. (#{@recount})"
        BOT.stream("Hot Piss", "https://www.twitch.tv/15secondgaming")
      end
    end
  end
end
