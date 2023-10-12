module Bot
  module DiscordCommands
    module Wildo
      extend Discordrb::Commands::CommandContainer
      command(:wildo, description: ":cross:️ :regional_indicator_y: :parking:️ :e_mail:   :regional_indicator_l: :information_source:️ :regional_indicator_k: :e_mail:   :cross:️ :regional_indicator_h: :information_source:️ :regional_indicator_s:") do |event, *args|
        $space = " "#"\u{200B}"
        words = ''
        args.each do |arg|
          word = ''
          unless (arg.count ":").to_i > 1
            if arg[0] == "@" || arg[1] == "@" || arg[0] == "\@"
              word = arg.to_s
            else
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
                  when "tm"
                    str += "™️"
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
                    str += "©️"
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
                    case rand(1..2)
                    when 1
                      str += "Ⓜ️"
                    when 2
                      str += "♏"
                    end
                  when "n"
                    str += "♑️"
                  when "o"
                    str += "🅾️"
                  when "p"
                    str += "🅿️"
                  when "q"
                    str += "🇶"
                  when "r"
                    str += "®️"
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
                    case rand(1..2)
                    when 1
                      str += "✖️"
                    when 2
                      str += "❎"
                    end
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
                    case rand(1..3)
                    when 1
                      str += "❗"
                    when 2
                      str += "❕"
                    when 3
                      str += "⚠️"
                    end
                  when "?"
                    case rand(1..2)
                    when 1
                      str += "❓"
                    when 2
                      str += "❔"
                    end
                  when " "
                    str += "   "
                  else
                    if arg[i].to_s.ascii_only?
                      str += "**#{arg[i].upcase}**"
                    else
                      str += "#{arg[i]}"
                    end
                  end
                end
                i = i + buffer.length
                word += "#{str}#{$space}"
              end
            end
            word.sub! "#{$space}🏻", "🏻"
            word.sub! "#{$space}🏼", "🏼"
            word.sub! "#{$space}🏽", "🏽"
            word.sub! "#{$space}🏾", "🏾"
            word.sub! "#{$space}🏿", "🏿"
            word.sub! " ⃣", ""
            words += "#{word.strip}   "
          end
        end
        msg = words.strip

        begin
          Bot.log "#{event.author.username}: #{event.content}"
          unless event.message.channel.pm?
            event.message.delete
          end
          event.channel.split_send(msg)
        rescue Exception => msg
          Bot.log "Error with the wildo command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
