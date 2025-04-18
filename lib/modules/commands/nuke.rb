# frozen_string_literal: true

require 'open-uri'
require 'securerandom'

module Bot
  module DiscordCommands
    # nuke command
    module Nuke
      extend Discordrb::Commands::CommandContainer
      command(:nuke, description: 'nuke an image') do |event, *_args|
        Nuke.nuke_image(event)
      end

      def self.nuke_image(event)
        rnd     = SecureRandom.hex(3)
        input   = "data/images/input_#{rnd}.png"
        output  = "data/images/output_#{rnd}.png"

        Nuke.save_image(event, input)
        Nuke.alter_image(input, output)
        Bot.response_file(event, output)
        Nuke.cleanup(input, output)

        nil
      end

      def self.save_image(event, input)
        return unless event.message.attachments[0]

        url = event.message.attachments[0].url
        File.open(input, 'wb') do |file|
          file << URI.parse(url).open.read
        end
      rescue Errno::ENOENT => e
        Bot.log "Error while saving image to nuke: #{e}"
      end

      def self.alter_image(input, output)
        return unless File.exist? input

        cmd = "magick #{input} -define quantum:format=floating-point \
              -colorspace RGB -auto-gamma -evaluate Multiply 1.5 \
              -evaluate Pow 0.9 -colorspace sRGB -depth 16 \
              -profile data/2020_profile.icc #{output}"

        system(cmd)
      end

      def self.cleanup(input, output)
        system("rm \"#{input}\"") if File.exist? input
        system("rm \"#{output}\"") if File.exist? output
      rescue Errno::ENOENT => e
        Bot.log "Error while cleaning up nuke: #{e}"
      end
    end
  end
end
