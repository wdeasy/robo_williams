module Bot
  module DiscordCommands
    module Stim
      extend Discordrb::Commands::CommandContainer
      command(:stim, description: "TYPE ߷ LIKE ߷ THIS") do |event, *args|
        words = ''
        args.each do |arg|
          words += "#{arg.upcase} \u{7F7} "
        end
        msg = words.chomp(" \u{7F7} ")

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.channel.split_send(msg)
        rescue Exception => msg
          Bot.log "Error with the stim command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
