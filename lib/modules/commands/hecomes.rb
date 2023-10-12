require 'zalgo'

module Bot
  module DiscordCommands
    module HeComes
      extend Discordrb::Commands::CommandContainer
      command(:zalgo, description: "t͑͑̓yͮ͆̚p̓ͮ̀ê̊̒ ͆͘͞l̋ͩ̏i̇̓̇kͫͮͪe͐ͣͮ ̨ͨ̐҉_̻̘tͮ͂̀h͆ͮ͡i̎̋̅s͐̑ͪ") do |event, *args|
        words = ''
        args.each do |arg|
          words += "#{arg} "
        end
        msg = Zalgo.he_comes words.strip

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.channel.split_send(msg)
        rescue Exception => msg
          Bot.log "Error with the zalgo command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
