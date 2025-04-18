# frozen_string_literal: true

module Bot
  module DiscordCommands
    # Wildo command
    module Wildo
      extend Discordrb::Commands::CommandContainer

      @emojis = {
        'cool' => ['🆒'], 'free' => ['🆓'], 'back' => ['🔙'], 'soon' => ['🔜'], 'off' => ['📴'],
        'sos' => ['🆘'], 'atm' => ['🏧'], 'new' => ['🆕'], 'end' => ['🔚'], 'top' => ['🔝'],
        '100' => ['💯'], '777' => ['🎰'], 'zzz' => ['💤'], 'id' => ['🆔'], 'vs' => ['🆚'],
        'ab' => ['🆎'], 'cl' => ['🆑'], 'wc' => ['🚾'], 'ng' => ['🆖'], 'ok' => ['🆗'],
        'up' => ['🆙'], 'on' => ['🔛'], '21' => ['📅'], '!!' => ['‼️'], '!?' => ['⁉️'],
        'a' => ['🅰️'], 'b' => ['🅱️'], 'c' => ['🇨'], 'd' => ['🇩'], 'e' => ['📧'], 'f' => ['🇫'],
        'g' => ['🇬'], 'h' => ['🇭'], 'i' => ['ℹ️'], 'j' => ['🇯'], 'k' => ['🇰'], 'l' => ['🇱'],
        'm' => ['Ⓜ️', '♏'], 'n' => ['♑️'], 'o' => ['🅾️'], 'p' => ['🅿️'], 'q' => ['🇶'], 'r' => ['🇷'],
        's' => ['🇸'], 't' => ['✝️'], 'u' => ['⛎'], 'v' => ['🇻'], 'w' => ['🇼'], 'x' => ['✖️', '❎'],
        'y' => ['🇾'], 'z' => ['🇿'], '0' => ['0⃣'], '1' => ['1⃣'], '2' => ['2⃣'], '3' => ['3⃣'],
        '4' => ['4⃣'], '5' => ['5⃣'], '6' => ['6⃣'], '7' => ['7⃣'], '8' => ['8⃣'], '9' => ['9⃣'],
        '#' => ['#⃣'], '*' => ['*⃣'], '!' => ['❗', '❕', '⚠️'], '?' => ['❓', '❔'], ' ' => ['   ']
      }

      command(:wildo, description: '✝️️ 🇾 🅿️️ 📧   🇱 ℹ️️ 🇰 📧   ✝️️ 🇭 ℹ️️ 🇸') do |event, *args|
        Bot.message_response(event, Bot.build_words(@emojis, args))
      end
    end
  end
end
