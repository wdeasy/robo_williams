require 'date'

module Bot
  def self.thursday_check
    return unless Date.today.strftime("%A") == "Thursday" && Date.today.day == 20

    Bot.post_file("data/images/thursday20.jpeg")
  end
end
