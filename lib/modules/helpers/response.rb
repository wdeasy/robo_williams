# frozen_string_literal: true

# Response helpers
module Bot
  def self.message_response(event, msg)
    Bot.log_command(event)
    event.channel.split_send(msg)
  rescue StandardError => e
    Bot.log "Error with the #{event.command.name} command."
    Bot.log_exception(e)
  end

  def self.file_response(event, file)
    Bot.log_command(event)
    event.send_file(File.open(file, 'r')) if File.exist? file
  rescue StandardError => e
    Bot.log "Error with the #{event.command.name} command."
    Bot.log_exception(e)
  end
end
