require 'date'

module Bot
  def self.shoutout_check
    shoutouts = DB[:shoutouts]
    shoutouts.each do |shoutout|
      next unless shoutout[:day].month == Date.today.month && shoutout[:day].day == Date.today.day

      name = shoutout[:discord].nil? ? shoutout[:name] : shoutout[:discord]
      Bot.post_message("\@here LETS GIVE A QUICK SHOUT OUT TO #{name}")
    end
  end
end
