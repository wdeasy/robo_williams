module Bot
  def self.post_response(event, msg)
    begin
      Bot.log "#{event.author.username}: #{event.content}"
      event.message.delete unless event.message.channel.pm?
      event.channel.split_send(msg)
    rescue Exception => e
      Bot.log "Error with the #{event.command.name} command."
      Bot.log_exception(e)      
    end
  end

  def self.post_message(msg)
    begin
      Bot.log "Posting #{msg}"
      BOT.channel(CONFIG.channel).split_send(msg)
    rescue Exception => e
      Bot.log_exception(e)
    end
  end

  def self.post_file(file)
    begin 
      Bot.log "Posting #{file}"
      BOT.channel(CONFIG.channel).send_file(File.open(file,'r'))
    rescue Exception => e
      Bot.log_exception(e)
    end
  end
end