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

            url = URI(args[0])
            next if url.host.nil?  
            next unless ['youtu.be', 'youtube.com', 'www.youtube.com'].include?(url.host)

            next unless event.user.voice_channel
            BOT.voice_connect(event.user.voice_channel)

            voice_bot = event.voice

            begin
                Timeout.timeout(CONFIG.timeout){
                    voice_bot.play_io(IO.popen("yt-dlp -q -o - #{url}"))   
                }                
            rescue Timeout::Error
                Bot.log "Youtubes hit #{CONFIG.timeout} timeout."
            end

            voice_bot.destroy

            @playing = false
            nil
        end
      end
    end
  end