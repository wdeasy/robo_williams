# frozen_string_literal: true

# Thursday the 20th
module Bot
  def self.thursday_check
    return unless @today.strftime('%A') == 'Thursday' && @today.day == 20

    Bot.post_file('data/images/thursday20.jpeg')
  end
end
