require 'date'
require 'time'

module Bot
  def self.loop

    @last_motd = Date.today unless @last_motd

    if Date.today > @last_motd
      @last_motd = Date.today

      #thursday the 20th
      Bot.thursday_check

      #shoutouts
      Bot.shoutout_check
    end

  end
end
