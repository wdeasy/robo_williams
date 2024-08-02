# frozen_string_literal: true

require 'English'
require 'shellwords'

module Bot
  module DiscordCommands
    # HLDJ command
    module HLDJ
      extend Discordrb::Commands::CommandContainer
      @playing = nil

      command(:hldj, description: 'Play audio in your current voice channel') do |event, *args|
        HLDJ.play_audio(event, args[0])
      end

      def self.play_audio(event, url)
        Bot.log "#{event.author.username}: #{event.content}"
        event.message.delete unless event.message.channel.pm?
        return unless @playing.nil? && event.user.voice_channel

        @playing = HLDJ.valid_url(url)
        return unless @playing

        voice = HLDJ.connect(event)
        HLDJ.play(voice, @playing)
        HLDJ.disconnect(voice)
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
        Bot.log "HLDJ hit #{CONFIG.timeout} timeout."
      end

      def self.valid_url(url)
        URI(url)
      rescue URI::InvalidURIError
        Bot.log 'Invalid URL.'
      end
    end
  end
end
