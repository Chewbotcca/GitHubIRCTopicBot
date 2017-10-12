require 'cinch'

Dir["#{File.dirname(__FILE__)}/plugins/*.rb"].each { |file| require file }

bot = Cinch::Bot.new do
  configure do |c|
    # Bot Settings, Taken from Config.yaml
    c.nick = "ForasthaBOT"
    c.server = "irc.chew.pro"
    c.channels = ['#Chewbotcca']

    c.plugins.prefix = /^/

    # Load modules.
    c.plugins.plugins = [AddIssueToTopic, RemoveIssueFromTopic, NickServ, SetAmountOfIssues]
  end
end

bot.start
