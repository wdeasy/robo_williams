module Bot
  def self.send_response(event, message)
    begin
      Bot.log "#{event.author.username}: #{event.content}"
      event.message.delete unless event.message.channel.pm?
      event.channel.split_send(message)
    rescue Exception => e
      Bot.log "Error with the #{event.command.name} command."
      Bot.log e
    end
  end
end