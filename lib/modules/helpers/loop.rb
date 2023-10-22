require 'date'
require 'time'

module Bot
  @last_motd = Date.today

  def self.loop

    if Date.today > @last_motd
      @last_motd = Date.today

      #thursday the 20th
      Bot.thursday_check

      #shoutouts
      Bot.shoutout_check
    end

  end
end
