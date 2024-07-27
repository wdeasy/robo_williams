require 'shellwords'

module Bot
  module DiscordCommands
    module Youtubes
      extend Discordrb::Commands::CommandContainer
      @playing = false

      command(:youtubes, description: "Play the audio of a youtube video.") do |event, *args|
        Bot.log "#{event.author.username}: #{event.content}"
        event.message.delete unless event.message.channel.pm?        

        next unless @playing == false
        @playing = true          

        url = Youtubes.valid_url(args[0])
        next unless url && event.user.voice_channel

        BOT.voice_connect(event.user.voice_channel)
        voice_bot = event.voice
        Youtubes.play(voice_bot, url)
        voice_bot.destroy

        @playing = false
        nil
      end
    end

    def self.play(voice_bot, url)
      Timeout.timeout(CONFIG.timeout){
        cmd = "yt-dlp -q -o - #{Shellwords.escape(url)}"

        IO.popen(cmd) do |stream|
          voice_bot.play_io(stream)

          stream.close
          Bot.log "yt-dlp exited #{$?.exitstatus}" unless $?.success?
        end
      } 
    rescue Timeout::Error
      Bot.log "Youtubes hit #{CONFIG.timeout} timeout."
    end      

    def self.valid_url(url)
      uri = URI(url)
      return unless ['youtu.be', 'youtube.com', 'www.youtube.com'].include?(url.host)
    rescue URI::InvalidURIError
      Bot.log "Invalid Youtube URL."
    end
  end
end