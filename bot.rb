require 'cinch'
require 'yaml'
require 'rest-client'

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
    c.plugins.plugins = [AddIssueToTopic, RemoveIssueFromTopic, NickServ, SetAmountOfIssues]
  end
end

bot.start
