module Bot
  module DiscordCommands
    module Jeb
      extend Discordrb::Commands::CommandContainer
      command(:jeb, description: "TYPE:clap:LIKE:clap:THIS") do |event, *args|
        words = ''
        args.each do |arg|
          words += "**#{arg.upcase}**:clap:"
        end
        msg = words.chomp(':clap:')

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.channel.split_send(msg)
        rescue Exception => msg
          Bot.log "Error with the jeb command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
