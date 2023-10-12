module Bot
  module DiscordCommands
    module Listening
      extend Discordrb::Commands::CommandContainer
      command(:listening, description: "Set what Robo Williams is listening to.") do |event, *args|
        words = ''
        args.each do |arg|
          words += "#{arg} "
        end

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          BOT.listening = words[0..19]
        rescue Exception => msg
          Bot.log "Error with the listening command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
