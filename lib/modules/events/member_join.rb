module Bot
  module DiscordEvents
    module MemberJoin
      extend Discordrb::EventContainer
      member_join do |event|
        sleep 5

        Bot.post_message("Who the fuck is #{event.user.mention}?")
      end
    end
  end
end
