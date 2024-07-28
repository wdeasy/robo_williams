# frozen_string_literal: true

# Emoji helpers
module Bot
  def self.no_emoji(char)
    "**#{char}**"
  end

  def self.skip_word(arg)
    return true if arg[0] == ':' && arg[-1] == ':'
    return true if arg[0, 2] == '<@' && arg[-1] == '>'
    return true if arg[0] == '@'

    false
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
end
