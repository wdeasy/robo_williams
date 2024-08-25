# frozen_string_literal: true

# Emoji helpers
module Bot
  def self.build_words(emojis, args)
    words = []

    args.each do |arg|
      words << Bot.build_word(emojis, arg.downcase) unless arg.nil?
    end

    Bot.clean_words(words.join('   '))
  end

  def self.build_word(emojis, arg)
    return arg if Bot.skip_word(arg)

    word = []

    until arg.empty?
      buffer = Bot.get_buffer(emojis, arg)
      word << Bot.get_emoji(emojis, buffer)
      arg = arg[buffer.length..]
    end

    word.join(' ')
  end

  def self.get_buffer(emojis, string)
    until string.length == 1
      return string if emojis.key?(string)

      string = string[..-2]
    end

    string
  end

  def self.get_emoji(emojis, string)
    return emojis[string].sample if emojis.key?(string)

    "**#{string}**"
  end

  def self.clean_words(words)
    words.sub! ' 🏻', '🏻'
    words.sub! ' 🏼', '🏼'
    words.sub! ' 🏽', '🏽'
    words.sub! ' 🏾', '🏾'
    words.sub! ' 🏿', '🏿'
    words.sub! ' ⃣', ''

    words.strip
  end  

  def self.skip_word(arg)
    return true if arg[0] == ':' && arg[-1] == ':'
    return true if arg[0, 2] == '<@' && arg[-1] == '>'
    return true if arg[0] == '@'

    false
  end
end
