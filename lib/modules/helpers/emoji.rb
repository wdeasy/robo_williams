module Bot
    def self.no_emoji(i)
      "**#{i}**"
    end
  
    def self.skip_word(arg)
      return true if (arg[0] == ":" && arg[-1] == ":")
      return true if (arg[0,2] == "<@" && arg[-1] == ">")
      return true if arg[0] == "@"
  
      false
    end
  
    def self.clean_words(words)
      words.sub! " 🏻", "🏻"
      words.sub! " 🏼", "🏼"
      words.sub! " 🏽", "🏽"
      words.sub! " 🏾", "🏾"
      words.sub! " 🏿", "🏿"
      words.sub! " ⃣", ""
  
      words.strip
    end
  end