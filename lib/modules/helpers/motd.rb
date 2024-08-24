# frozen_string_literal: true

require 'date'

# MOTD
module Bot
  @today = Date.today

  def self.motd
    return unless Date.today > @today

    @today = Date.today

    # thursday the 20th
    Bot.thursday_check

    # shoutouts
    Bot.shoutout_check

    # quakecon
    Bot.quakecon_check
  end
end
