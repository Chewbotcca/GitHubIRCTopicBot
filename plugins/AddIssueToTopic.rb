class AddIssueToTopic
  include Cinch::Plugin

  match /[ChewbotccaIRC] Chewsterchew opened issue/, :use_prefix => false, :strip_colors => true, method: => :addissue

  def addissue(m)
    m.reply "You got it"
    topicsplit = m.channel.topic.split(' ')
    topcisplit[11] = topicsplit[11].to_i + 1
    m.channel.topic=topicsplit.join(' ')
  end
end
