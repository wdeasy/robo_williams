# frozen_string_literal: true

module Bot
  module DiscordEvents
    # Message events
    module Message
      extend Discordrb::EventContainer
      message do |event|
        Message.process(event)
      end

      def self.process(event)
        matches = Message.matches(event.content)
        return if matches.empty?

        Bot.log_message(event)

        match = Message.pick_match(matches)
        Message.reply(event, match)
      end

      def self.matches(content)
        matches = []

        DB[:messages].each do |msg|
          matches.push(msg) if content.downcase.match(msg[:regex])
        end

        matches
      end

      def self.pick_match(matches)
        max = matches.max_by { |m| m[:regex].length }[:regex].length
        filtered = matches.select { |match| match[:regex].length == max }

        filtered.sample
      end

      def self.reply(event, match)
        msg = event
        msg = Message.reply_file(event, match[:file]) unless match[:file].nil?
        msg = Message.reply_text(event, match[:text]) unless match[:text].nil?

        Message.reply_emoji(msg, match[:emoji]) unless match[:emoji].nil?
      end

      def self.reply_file(event, file)
        event.send_file(File.open("data/images/#{file}", 'r'))
      rescue StandardError => e
        Bot.log_exception(e)
      end

      def self.reply_text(event, text)
        event.respond(text)
      rescue StandardError => e
        Bot.log_exception(e)
      end

      def self.reply_emoji(event, emoji)
        event.react(emoji)
      rescue StandardError => e
        Bot.log_exception(e)
      end
    end
  end
end
