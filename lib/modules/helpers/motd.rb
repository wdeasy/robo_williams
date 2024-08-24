# frozen_string_literal: true

require 'date'

# MOTD
module Bot
  @today = @start = Date.today

  def self.motd
    return unless Date.today > @today

    @today = Date.today
    Bot.log "Level #{(@today - @start).to_i}."

    # thursday the 20th
    Bot.thursday_check

    # shoutouts
    Bot.shoutout_check

    # quakecon
    Bot.quakecon_check
  end
end
