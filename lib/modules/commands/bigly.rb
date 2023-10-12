module Bot
  module DiscordCommands
    module Bigly
      extend Discordrb::Commands::CommandContainer
      command(:bigly, description: ":regional_indicator_t: :regional_indicator_y: :regional_indicator_p: :regional_indicator_e:   :regional_indicator_l: :regional_indicator_i: :regional_indicator_k: :regional_indicator_e:   :regional_indicator_t: :regional_indicator_h: :regional_indicator_i: :regional_indicator_s:") do |event, *args|
        $space = " "#"\u{200B}"
        words = ''
        args.each do |arg|
          word = ''
          unless (arg.count ":").to_i > 1
            if arg[0] == "@" || arg[1] == "@" || arg[0] == "\@"
              word = arg.to_s
            else
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
                  if a.to_s.ascii_only?
                    word += "**#{a.upcase}**"
                  else
                    word += "#{a}"
                  end
                end
                word += "#{$space}"
              end
            end
            word.sub! "#{$space}🏻", "🏻"
            word.sub! "#{$space}🏼", "🏼"
            word.sub! "#{$space}🏽", "🏽"
            word.sub! "#{$space}🏾", "🏾"
            word.sub! "#{$space}🏿", "🏿"
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
          Bot.log "Error with the bigly command."
          Bot.log msg
        end
        return nil
      end
    end
  end
end
