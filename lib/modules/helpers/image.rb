# frozen_string_literal: true

require 'open-uri'
require 'securerandom'

# Image helpers
module Bot
  def self.process_image(event)
    rnd     = SecureRandom.hex(3)
    input   = "data/images/input_#{rnd}.png"
    output  = "data/images/output_#{rnd}.png"

    Bot.save_image(event, input)
    Bot.alter_image(input, output, event)
    Bot.response_file(event, output)
    Bot.cleanup_images(input, output)

    nil
  end

  def self.save_image(event, input)
    return unless event.message.attachments[0]

    url = event.message.attachments[0].url
    File.open(input, 'wb') do |file|
      file << URI.parse(url).open.read
    end
  rescue Errno::ENOENT => e
    Bot.log "Error while saving image: #{e}"
  end

  def self.alter_image(input, output, event)
    return unless File.exist? input

    case event.command.name
    when :nuke
      Bot.nuke_image(input, output)
    else
      Bot.log "No image case for #{event.command.name}"
    end
  end

  def self.cleanup_images(input, output)
    system("rm \"#{input}\"") if File.exist? input
    system("rm \"#{output}\"") if File.exist? output
  rescue Errno::ENOENT => e
    Bot.log "Error while cleaning up images: #{e}"
  end

  def self.nuke_image(input, output)
    cmd = "magick \"#{input}\" -define quantum:format=floating-point \
          -colorspace RGB -auto-gamma -evaluate Multiply 1.5 \
          -evaluate Pow 0.9 -colorspace sRGB -depth 16 \
          -profile data/2020_profile.icc \"#{output}\""

    system(cmd)
  end
end
