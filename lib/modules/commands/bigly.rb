# frozen_string_literal: true

module Bot
  module DiscordCommands
    # Bigly command
    module Bigly
      extend Discordrb::Commands::CommandContainer

      @emojis = {
        'a' => ['🇦'],
        'b' => ['🇧'],
        'c' => ['🇨'],
        'd' => ['🇩'],
        'e' => ['🇪'],
        'f' => ['🇫'],
        'g' => ['🇬'],
        'h' => ['🇭'],
        'i' => ['🇮'],
        'j' => ['🇯'],
        'k' => ['🇰'],
        'l' => ['🇱'],
        'm' => ['🇲'],
        'n' => ['🇳'],
        'o' => ['🇴'],
        'p' => ['🇵'],
        'q' => ['🇶'],
        'r' => ['🇷'],
        's' => ['🇸'],
        't' => ['🇹'],
        'u' => ['🇺'],
        'v' => ['🇻'],
        'w' => ['🇼'],
        'x' => ['🇽'],
        'y' => ['🇾'],
        'z' => ['🇿'],
        '0' => ['0⃣'],
        '1' => ['1⃣'],
        '2' => ['2⃣'],
        '3' => ['3⃣'],
        '4' => ['4⃣'],
        '5' => ['5⃣'],
        '6' => ['6⃣'],
        '7' => ['7⃣'],
        '8' => ['8⃣'],
        '9' => ['9⃣'],
        '#' => ['#⃣'],
        '*' => ['*⃣'],
        ' ' => ['   ']
      }

      command(:bigly, description: '🇹 🇾 🇵 🇪    🇱 🇮 🇰 🇪    🇹 🇭 🇮 🇸') do |event, *args|
        Bot.response_message(event, Bot.build_words(@emojis, args))
      end
    end
  end
end
