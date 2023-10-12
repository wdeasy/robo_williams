require 'uri'

module Bot
  module DiscordCommands
    module Streaming
      extend Discordrb::Commands::CommandContainer
      command(:streaming, description: "Set what Robo Williams is streaming.") do |event, *args|
        words = ''
        url = "https://www.twitch.tv/15secondgaming"

        args.each do |arg|
          if URI.parse(arg).kind_of?(URI::HTTP)
            url = arg
          else
            words += "#{arg} "
          end
        end

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          BOT.stream(words, url)
        rescue Exception => msg
          Bot.log "Error with the streaming command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
