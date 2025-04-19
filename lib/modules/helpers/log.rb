# frozen_string_literal: true

require 'time'

# Log helpers
module Bot
  def self.log_command(event)
    Bot.log "#{event.author.username}: #{event.content}"
    event.message.delete unless event.message.channel.pm?
  rescue StandardError => e
    Bot.log 'Error while logging command.'
    Bot.log_exception(e)
  end

  def self.log(message)
    puts "[#{Time.now.strftime('%d/%m/%y %H:%M:%S')}] -- #{message}"
  end

  def self.log_exception(exception)
    Bot.log "#{exception.class}: #{exception.message}"
  end
end
