require 'date'

module Bot
  def self.quakecon_check
    count = Date.parse(CONFIG.quakecon).mjd - Date.today.mjd

    case
    when count > 0
      BOT.channel(CONFIG.category).name = "Quakecon [#{count} days] - 🤖"
    when count == 1
      BOT.channel(CONFIG.category).name = "Quakecon [#{count} day] - 🤖"
    when count.between?(0, -3)
      BOT.channel(CONFIG.category).name = "It's Quakecon! - 🤖"      
    else
      BOT.channel(CONFIG.category).name = "Quakecon - 🤖"
    end
  end
end
