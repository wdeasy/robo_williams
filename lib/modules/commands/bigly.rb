module Bot
  module DiscordCommands
    module Bigly
      extend Discordrb::Commands::CommandContainer
      command(:bigly, description: ":regional_indicator_t: :regional_indicator_y: :regional_indicator_p: :regional_indicator_e:   :regional_indicator_l: :regional_indicator_i: :regional_indicator_k: :regional_indicator_e:   :regional_indicator_t: :regional_indicator_h: :regional_indicator_i: :regional_indicator_s:") do |event, *args|
        words = ''
        args.each do |arg|
          word = ''

          if (arg[0] == ":" && arg[-1] == ":") || (arg[0,2] == "<@" && arg[-1] == ">") || arg[0] == "@"
            words += "#{arg.to_s.strip}   "
            next
          end

          arg.downcase!
          arg.split("").each do |a|
            case a.downcase
            when 'a'
              word += "🇦"
            when 'b'
              word += "🇧"
            when 'c'
              word += "🇨"
            when 'd'
              word += "🇩"
            when 'e'
              word += "🇪"
            when 'f'
              word += "🇫"
            when 'g'
              word += "🇬"
            when 'h'
              word += "🇭"
            when 'i'
              word += "🇮"
            when 'j'
              word += "🇯"
            when 'k'
              word += "🇰"
            when 'l'
              word += "🇱"
            when 'm'
              word += "🇲"
            when 'n'
              word += "🇳"
            when 'o'
              word += "🇴"
            when 'p'
              word += "🇵"
            when 'q'
              word += "🇶"
            when 'r'
              word += "🇷"
            when 's'
              word += "🇸"
            when 't'
              word += "🇹"
            when 'u'
              word += "🇺"
            when 'v'
              word += "🇻"
            when 'w'
              word += "🇼"
            when 'x'
              word += "🇽"
            when 'y'
              word += "🇾"
            when 'z'
              word += "🇿"
            when '0'
              word += "0⃣"
            when '1'
              word += "1⃣"
            when '2'
              word += "2⃣"
            when '3'
              word += "3⃣"
            when '4'
              word += "4⃣"
            when '5'
              word += "5⃣"
            when '6'
              word += "6⃣"
            when '7'
              word += "7⃣"
            when '8'
              word += "8⃣"
            when '9'
              word += "9⃣"
            when '#'
              word += "#⃣"
            when '*'
              word += "*⃣"
            else
              word += a.to_s.ascii_only? ? "**#{a.upcase}**" : "#{a}"
            end
            word += " "
          end

          words += "#{word.strip}   "
        end

        words.sub! " 🏻", "🏻"
        words.sub! " 🏼", "🏼"
        words.sub! " 🏽", "🏽"
        words.sub! " 🏾", "🏾"
        words.sub! " 🏿", "🏿"        

        msg = words.strip

        Bot.send_response(event, msg)
      end
    end
  end
end
