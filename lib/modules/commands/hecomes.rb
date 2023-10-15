require 'zalgo'

module Bot
  module DiscordCommands
    module HeComes
      extend Discordrb::Commands::CommandContainer
      command(:zalgo, description: "t͑͑̓yͮ͆̚p̓ͮ̀ê̊̒ ͆͘͞l̋ͩ̏i̇̓̇kͫͮͪe͐ͣͮ ̨ͨ̐҉_̻̘tͮ͂̀h͆ͮ͡i̎̋̅s͐̑ͪ") do |event, *args|
        Bot.post_response(event, Zalgo.he_comes(args.join(" ").strip))
      end
    end
  end
end
