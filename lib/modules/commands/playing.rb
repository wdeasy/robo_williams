module Bot
  module DiscordCommands
    module Playing
      extend Discordrb::Commands::CommandContainer
      command(:playing, description: "Set what Robo Williams is playing.") do |event, *args|
        words = ''
        args.each do |arg|
          words += "#{arg} "
        end

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          BOT.game = words[0..19]
        rescue Exception => msg
          Bot.log "Error with the playing command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
