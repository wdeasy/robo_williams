# frozen_string_literal: true

require 'English'
require 'shellwords'

module Bot
  module DiscordCommands
    # Youtubes command
    module Youtubes
      extend Discordrb::Commands::CommandContainer
      @playing = nil

      command(:youtubes, description: 'Play the audio of a youtube video.') do |event, *args|
        Youtubes.play_youtube(event, args[0])
      end

      def self.play_youtube(event, url)
        Bot.log "#{event.author.username}: #{event.content}"
        event.message.delete unless event.message.channel.pm?
        return unless @playing.nil? && event.user.voice_channel

        @playing = Youtubes.valid_url(url)
        return unless @playing

        voice = Youtubes.connect(event)
        Youtubes.play(voice, @playing)
        Youtubes.disconnect(voice)
      end

      def self.connect(event)
        BOT.voice_connect(event.user.voice_channel)
        event.voice
      end

      def self.disconnect(voice_bot)
        voice_bot.destroy

        @playing = nil
      end

      def self.play(voice, url)
        Timeout.timeout(CONFIG.timeout) do
          cmd = "yt-dlp -q -o - #{Shellwords.escape(url)}"

          IO.popen(cmd) do |stream|
            voice.play_io(stream)

            stream.close
            Bot.log "yt-dlp exited #{$CHILD_STATUS.exitstatus}" unless $CHILD_STATUS.success?
          end
        end
      rescue Timeout::Error
        Bot.log "Youtubes hit #{CONFIG.timeout} timeout."
      end

      def self.valid_url(url)
        uri = URI(url)
        return unless ['youtu.be', 'youtube.com', 'www.youtube.com'].include?(uri.host)

        uri.to_s
      rescue URI::InvalidURIError
        Bot.log 'Invalid Youtube URL.'
      end
    end
  end
end
