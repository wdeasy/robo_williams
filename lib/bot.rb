require 'bundler/setup'
require 'discordrb'
require 'sequel'
require 'yaml'

module Bot
  unless File.exists? ENV['CLIENT_FILE']
    Bot.log "Discord Client ID missing. Exiting."
    exit 1
  end

  unless File.exists? ENV['TOKEN_FILE']
    Bot.log "Discord Token missing. Exiting."
    exit 1
  end

  #bot config
  CONFIG = OpenStruct.new YAML.load_file 'data/config.yaml'

  #create the bot
  BOT = Discordrb::Commands::CommandBot.new(client_id: IO.read(ENV['CLIENT_FILE']).chomp,
                                            token: IO.read(ENV['TOKEN_FILE']).chomp,
                                            prefix: CONFIG.prefix,
                                            ignore_bots: true)

  #database
  Sequel.extension :migration
  DB = Sequel.sqlite
  Sequel::Migrator.run(DB, CONFIG.migrations)

  #garbage collection
  $last_gc = Date.today

  #reconnect counter (times bot has reconnected)
  $recount = 0

  #disconnect counter (how long bot has been disconnected)
  $disc_count = 0

  #start time
  $start_time = Time.now

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

  #run
  BOT.run
end
