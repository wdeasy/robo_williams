require 'date'
require 'time'

module Bot
  def self.loop
    if $heartbeat_in_progress == true
      Bot.log "Previous hearbeat not finished."
      return 
    end

    $heartbeat_in_progress = true

    if Date.today > $last_motd
      $last_motd = Date.today

      #thursday the 20th
      Bot.thursday_check

      #shoutouts
      Bot.shoutout_check
    end

    $heartbeat_in_progress = false
  end
end
