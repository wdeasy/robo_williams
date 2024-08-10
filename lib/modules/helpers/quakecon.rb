# frozen_string_literal: true

# Quakecon
module Bot
  @quakecon = Date.parse(CONFIG[:quakecon])

  def self.quakecon_check
    count = (@quakecon - @today).to_i

    parts = [] << 'Quakecon'
    parts << Bot.countdown(count)
    parts << '🤖'

    Bot.channel_name(parts.join(' '))
  end

  def self.countdown(count)
    return "-[#{count} DAYS]-" if count >= 2
    return "-[#{count} DAY]-" if count == 1
    return '-[YEA NOW]-' if count.between?(-3, 0)

    '-'
  end

  def self.channel_name(name)
    Bot.log name
    BOT.channel(CONFIG[:category]).name = name
  rescue StandardError => e
    Bot.log_exception(e)
  end
end
