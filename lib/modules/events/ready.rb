module Bot
  module DiscordEvents
    module Ready
      @recount = 0

      extend Discordrb::EventContainer
      ready do |event|
        @recount+=1

        Bot.log "I've powered up, get my program set. (#{@recount})"
        BOT.stream("Hot Piss", "https://www.twitch.tv/15secondgaming")
      end
    end
  end
end
