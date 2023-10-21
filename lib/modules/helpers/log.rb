require 'time'

module Bot
  def self.log(message)
    puts "[#{Time.now.strftime("%d/%m/%y %H:%M:%S")}] -- #{message}"
  end

  def self.log_exception(exception)
    Bot.log "#{exception.class}: #{exception.message}"
  end
end
