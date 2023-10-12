require 'talk_like_a_pirate'

module Bot
  module DiscordCommands
    module Pirate
      extend Discordrb::Commands::CommandContainer
      command(:pirate, description: "Ye be typin like this") do |event, *args|
        words = ''
        args.each do |arg|
          words += "#{arg} "
        end
        msg = TalkLikeAPirate.translate(words.strip)

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.channel.split_send(msg)
        rescue Exception => msg
          Bot.log "Error with the pirate command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
