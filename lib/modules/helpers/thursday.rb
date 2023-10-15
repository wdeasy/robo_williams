require 'date'

module Bot
  def self.thursday_check
    return unless Date.today.strftime("%A") == "Thursday" && Date.today.day == 20
    
    begin
      Bot.send_file(CONFIG.channel, File.open("data/images/thursday20.jpeg",'r'))
      Bot.log "Thursday the 20th"
    rescue Exception => msg
      Bot.log "Error posting Thursday the 20th."
      Bot.log msg
    end
  end
end
