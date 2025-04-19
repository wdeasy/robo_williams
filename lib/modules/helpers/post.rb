# frozen_string_literal: true

# Post helpers
module Bot
  def self.post_message(msg)
    Bot.log "Posting #{msg}"
    BOT.channel(CONFIG[:channel]).split_send(msg)
  rescue StandardError => e
    Bot.log_exception(e)
  end

  def self.post_file(file)
    Bot.log "Posting #{file}"
    BOT.channel(CONFIG[:channel]).send_file(File.open(file, 'r'))
  rescue StandardError => e
    Bot.log_exception(e)
  end
end
