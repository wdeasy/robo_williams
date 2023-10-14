module Bot
  def self.send_response(event, message, command)
    begin
      Bot.log "#{event.author.username}: #{event.content}"
      event.message.delete unless event.message.channel.pm?
      event.channel.split_send(message)
    rescue Exception => e
      Bot.log "Error with the #{command} command."
      Bot.log e
    end
  end
end