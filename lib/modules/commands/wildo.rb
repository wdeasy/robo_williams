module Bot
  module DiscordCommands
    module Wildo
      extend Discordrb::Commands::CommandContainer
      command(:wildo, description: ":cross:️ :regional_indicator_y: :parking:️ :e_mail:   :regional_indicator_l: :information_source:️ :regional_indicator_k: :e_mail:   :cross:️ :regional_indicator_h: :information_source:️ :regional_indicator_s:") do |event, *args|
        words = ''
        args.each do |arg|
          word = ''

          if (arg[0] == ":" && arg[-1] == ":") || (arg[0,2] == "<@" && arg[-1] == ">") || arg[0] == "@"
            words += "#{arg.to_s.strip}   "
            next
          end

          arg.downcase!
          buffer = ''
          word = ''
          i = 0

          while i < arg.length
            buffer = arg[i..i+3]
            str = ''
            case buffer
            when "cool"
              str += "🆒"
            when "free"
              str += "🆓"
            when "back"
              str += "🔙"
            when "soon"
              str += "🔜"
            end

            if str == ''
              buffer = arg[i..i+2]
              case buffer
              when "off"
                str += "📴"
              when "sos"
                str += "🆘"
              when "atm"
                str += "🏧"
              when "new"
                str += "🆕"
              when "end"
                str += "🔚"
              when "top"
                str += "🔝"
              when "100"
                str += "💯"
              when "777"
                str += "🎰"                
              when "zzz"
                str += "💤"
              end
            end

            if str == ''
              buffer = arg[i..i+1]
              case buffer
              when "id"
                str += "🆔"
              when "vs"
                str += "🆚"
              when "ab"
                str += "🆎"
              when "cl"
                str += "🆑"
              when "wc"
                str += "🚾"
              when "ng"
                str += "🆖"
              when "ok"
                str += "🆗"
              when "up"
                str += "🆙"
              when "on"
                str += "🔛"
              when "21"
                str += "📅"
              when "!!"
                str += "‼️"
              when "!?"
                str += "⁉️"
              end
            end

            if str == ''
              buffer = arg[i]
              case buffer
              when "a"
                str += "🅰️"
              when "b"
                str += "🅱️"
              when "c"
                str += "🇨"
              when "d"
                str += "🇩"
              when "e"
                str += "📧"
              when "f"
                str += "🇫"
              when "g"
                str += "🇬"
              when "h"
                str += "🇭"
              when "i"
                str += "ℹ️"
              when "j"
                str += "🇯"
              when "k"
                str += "🇰"
              when "l"
                str += "🇱"
              when "m"
                str += ["Ⓜ️","♏"].sample
              when "n"
                str += "♑️"
              when "o"
                str += "🅾️"
              when "p"
                str += "🅿️"
              when "q"
                str += "🇶"
              when "r"
                str += "🇷"
              when "s"
                str += "🇸"
              when "t"
                str += "✝️"
              when "u"
                str += "⛎"
              when "v"
                str += "🇻"
              when "w"
                str += "🇼"
              when "x"
                str += ["✖️","❎"].sample
              when "y"
                str += "🇾"
              when "z"
                str += "🇿"
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
              when "!"
                str += ["❗","❕","⚠️"].sample
              when "?"
                str += ["❓","❔"].sample                
              when " "
                str += "   "
              else
                word += "**#{arg[i]}**"
              end
            end
            i = i + buffer.length
            word += "#{str} "
          end

          words += "#{word.strip}   "
        end

        words.sub! " 🏻", "🏻"
        words.sub! " 🏼", "🏼"
        words.sub! " 🏽", "🏽"
        words.sub! " 🏾", "🏾"
        words.sub! " 🏿", "🏿"
        words.sub! " ⃣", ""        

        msg = words.strip

        Bot.post_response(event, msg)
      end
    end
  end
end
