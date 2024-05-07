require 'date'

module Bot
  def self.quakecon_check
    count = Date.parse(CONFIG.quakecon).mjd - Date.today.mjd
    parts = [] << "Quakecon"

    case
    when count > 1
      parts << "-[#{count} DAYS]-"
    when count == 1
      parts << "-[#{count} DAY]-"
    when count.between?(0, -3)
      parts << "-[NOW]-"
    else
      parts << "-"
    end

    parts << "🤖"
    Bot.set_channel_name(parts.join(' '))
  end

  def self.set_channel_name(name)
    begin
      Bot.log name
      BOT.channel(CONFIG.category).name = name
    rescue Exception => e
      Bot.log_exception(e)
    end
  end
end
