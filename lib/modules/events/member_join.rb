module Bot
  module DiscordEvents
    module MemberJoin
      extend Discordrb::EventContainer
      member_join do |event|
        begin
          Bot.log "#{event.user.name} has joined the server."
          sleep 5
          event.server.general_channel.send_message "Who the fuck is #{event.user.mention}?"
        rescue Exception => msg
          Bot.log "Error with the member_join event."
          Bot.log msg
        end
      end
    end
  end
end
