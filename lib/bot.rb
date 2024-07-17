require 'bundler/setup'
require 'discordrb'
require 'sequel'
require 'yaml'

module Bot
  unless File.file? ENV['CLIENT_FILE']
    puts "Discord Client ID missing. Exiting."
    exit
  end

  unless File.file? ENV['TOKEN_FILE']
    puts "Discord Token missing. Exiting."
    exit
  end

  #bot config
  CONFIG = OpenStruct.new YAML.load_file 'data/config.yaml'

  options = {
    client_id: IO.read(ENV['CLIENT_FILE']).chomp,
    token: IO.read(ENV['TOKEN_FILE']).chomp,
    prefix: CONFIG.prefix,
    ignore_bots: true,
    log_mode: :normal
  }

  #create the bot
  BOT = Discordrb::Commands::CommandBot.new(**options)

  #database
  Sequel.extension :migration
  DB = Sequel.sqlite
  Sequel::Migrator.run(DB, CONFIG.migrations)

  #bot helpers
  Dir['lib/modules/helpers/*.rb'].each { |mod| load mod }

  #bot commands
  module DiscordCommands; end
  Dir['lib/modules/commands/*.rb'].each { |mod| load mod }
  DiscordCommands.constants.each do |mod|
    BOT.include! DiscordCommands.const_get mod
  end

  #bot events
  module DiscordEvents; end
  Dir['lib/modules/events/*.rb'].each { |mod| load mod }
  DiscordEvents.constants.each do |mod|
    BOT.include! DiscordEvents.const_get mod
  end

  #bot rate limiting
  BOT.bucket :limit, limit: 60, time_span: 60, delay: 1

  #logging
  $stdout.sync = true
  $stderr.sync = true

  #docker stop handling  
  at_exit do
    BOT&.stop
  end

  Signal.trap('TERM') do
    Bot.log 'Received SIGTERM. Shutting down.'
    exit
  end

  #run
  BOT.run
end
