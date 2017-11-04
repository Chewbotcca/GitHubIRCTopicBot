require 'cinch'
require 'yaml'
require 'rest-client'
require 'json'

CONFIG = YAML.load_file('config.yaml')

Dir["#{File.dirname(__FILE__)}/plugins/*.rb"].each { |file| require file }

bot = Cinch::Bot.new do
  configure do |c|
    # Bot Settings, Taken from Config.yaml
    c.nick = CONFIG['nickname']
    c.server = CONFIG['server']
    c.channels = [CONFIG['channels']]

    c.plugins.prefix = /^/

    # Load modules.
    c.plugins.plugins = [Issues, NickServ, SetRepo, Update, InviteToJoin, Pulls]
  end
end

bot.start
