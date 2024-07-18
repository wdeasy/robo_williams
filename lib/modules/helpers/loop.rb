require 'date'

module Bot
  @today = Date.today

  def self.loop

    if Date.today > @today
      @today = Date.today

      #thursday the 20th
      Bot.thursday_check

      #shoutouts
      Bot.shoutout_check

      #quakecon
      Bot.quakecon_check
    end
    Bot.quakecon_check
  end
end
