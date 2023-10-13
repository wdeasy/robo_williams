require 'date'

module Bot
  def self.shoutout_check
    shoutouts = DB[:shoutouts]
    shoutouts.each do |shoutout|
      if shoutout[:shoutout].month == Date.today.month && shoutout[:shoutout].day == Date.today.day
        begin
          msg = "LETS GIVE A QUICK SHOUT OUT TO #{shoutout[:discord].nil? ? shoutout[:name] : shoutout[:discord]}"
          Bot.log msg
          BOT.channel(CONFIG.channel).split_send("\@here #{msg}")
        rescue Exception => msg
          Bot.log "Error posting shoutout."
          Bot.log msg
        end
      end
    end
  end
end
