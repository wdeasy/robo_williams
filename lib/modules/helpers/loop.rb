require 'date'
require 'time'

module Bot
  def self.loop
    if $heartbeat_in_progress == true
      Bot.log "previous hearbeat not finished."
      return 
    end

    $heartbeat_in_progress = true

    if !BOT.connected?      
      Bot.log "Heartbeat skipped. Bot is not connected. #{$disc_count}"
      $disc_count+=1
      $heartbeat_in_progress = false      
      return
    end

    $disc_count=0

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
