require 'time'

module Bot
  def self.log(message)
    puts "[#{Time.now.strftime("%d/%m/%y %H:%M:%S")}] -- #{message}"
  end
end
