require 'date'

module Bot
  def self.quakecon_check
    count = Date.parse(CONFIG.quakecon).mjd - Date.today.mjd

    case
    when count > 0
      Bot.countdown("Quakecon [#{count} days] - 🤖")
    when count == 1
      Bot.countdown("Quakecon [#{count} day] - 🤖")
    when count.between?(0, -3)
      Bot.countdown("It's Quakecon! - 🤖")
    else
      Bot.countdown("Quakecon - 🤖")
    end
  end

  def self.countdown(msg)
    begin
      Bot.log msg
      BOT.channel(CONFIG.category).name = msg
    rescue Exception => e
      Bot.log_exception(e)
    end
  end
end
