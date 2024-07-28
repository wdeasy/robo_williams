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
        Bot.post_response(event, Bigly.build_words(args))
      end

      def self.build_words(args)
        words = []

        args.each do |arg|
          words << Bigly.build_word(arg.downcase) unless arg.nil?
        end

        Bot.clean_words(words.join('   '))
      end

      def self.build_word(arg)
        return arg.to_s if Bot.skip_word(arg)

        word = []

        arg.split('').each do |a|
          if @emojis.key?(a)
            word << @emojis[a].sample
            next
          end

          word << Bot.no_emoji(a)
        end

        word.join(' ')
      end
    end
  end
end
