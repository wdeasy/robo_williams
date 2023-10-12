require 'flippy'

module Bot
  module DiscordCommands
    module Flip
      extend Discordrb::Commands::CommandContainer
      command(:flip, description: "sᴉɥʇ əʞᴉl ədʎʇ") do |event, *args|
        words = ''
        args.each do |arg|
          words += "#{arg} "
        end
        msg = words.strip.flip

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.channel.split_send(msg)
        rescue Exception => msg
          Bot.log "Error with the flip command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
