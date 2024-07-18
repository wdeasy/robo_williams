module Bot
  @shoutouts = DB[:shoutouts]

  def self.shoutout_check
    @shoutouts.each do |shoutout|
      next unless shoutout[:day].month == @today.month && shoutout[:day].day == @today.day

      msg = "\@here LETS GIVE A QUICK SHOUT OUT TO "

      unless shoutout[:discord].nil?
        Bot.post_message(msg + shoutout[:discord])
        next
      end

      Bot.post_message(msg + shoutout[:name])
    end
  end
end
