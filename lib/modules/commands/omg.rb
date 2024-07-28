# frozen_string_literal: true

require 'vocaloo'

module Bot
  module DiscordCommands
    # OMG command
    module Omg
      extend Discordrb::Commands::CommandContainer
      command(:omg, description: 'TAAAWRLK LIIIWRKEEEWR THIIIWRS!!!') do |event, *args|
        Bot.post_response(event, args.map(&:upcase).join(' ').strip.hyperbolize.dramatize.stringosaur)
      end
    end
  end
end
