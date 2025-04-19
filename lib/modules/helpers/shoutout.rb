# frozen_string_literal: true

# Shoutouts
module Bot
  @shoutouts = DB[:shoutouts]

  def self.shoutout_check
    @shoutouts.each do |shoutout|
      next unless shoutout[:day].month == @today.month && shoutout[:day].day == @today.day

      msg = ['@here LETS GIVE A QUICK SHOUT OUT TO']
      msg << shoutout[:discord]
      msg << shoutout[:name]

      Bot.post_message(msg.compact.join(' ').strip)
    end
  end
end
