# frozen_string_literal: true

require 'English'
require 'shellwords'

# Voice helpers
module Bot
  @playing = nil

  def self.play_audio(event, url)
    Bot.log_command(event)
    return unless @playing.nil? && event.user.voice_channel

    @playing = Bot.valid_url(url)
    return unless @playing

    voice = Bot.join_voice(event)

    Bot.stream_audio(voice, @playing)
    Bot.leave_voice(voice)
  end

  def self.join_voice(event)
    BOT.voice_connect(event.user.voice_channel)
    event.voice.volume = CONFIG[:volume]

    event.voice
  end

  def self.leave_voice(voice)
    voice.destroy

    @playing = nil
  end

  def self.stream_audio(voice, url)
    Timeout.timeout(CONFIG[:timeout]) do
      cmd = "yt-dlp -q -o - #{Shellwords.escape(url)}"

      IO.popen(cmd) do |stream|
        voice.play_io(stream)

        stream.close
        Bot.log "yt-dlp exited #{$CHILD_STATUS.exitstatus}" unless $CHILD_STATUS.success?
      end
    end
  rescue Timeout::Error
    Bot.log "HLDJ hit #{CONFIG[:timeout]} timeout."
  end

  def self.valid_url(url)
    URI(url)
  rescue URI::InvalidURIError
    Bot.log 'Invalid URL.'
  end
end
