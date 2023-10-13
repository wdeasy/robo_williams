require 'date'
require 'time'

module Bot
  def self.loop
    if $heartbeat_in_progress == true
      Bot.log "previous hearbeat not finished."
      return 
    end

    $heartbeat_in_progress = true

    if !BOT.connected? && $disc_count > 2
      Bot.log "Bot has been disconnected for #{$disc_count} heartbeats. Restarting."
      exit 0
    end

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

    if Date.today > $last_gc
      $last_gc = Date.today
      Bot.log "Starting Garbage Collection."
      gc_start = Time.now
      GC.start
      Bot.log "Finished Garbage Collection. (#{Time.now - gc_start}sec)"
    end

    if ((Time.now - $start_time).to_i / (24 * 60 * 60)) >= CONFIG.uptime
      Bot.log "==> Restarting Bot!! #{Time.now} <=="
      exit 0
    end

    $heartbeat_in_progress = false

  end
end
