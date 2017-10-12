class RemoveIssueFromTopic
  include Cinch::Plugin

  match '[ChewbotccaIRC] Chewsterchew closed issue', use_prefix: :false, strip_colors: :true

  def execute(m)
    if "#{m.user.user}@#{m.user.host}" == 'notifico@ChewCraft-p8h.k4l.199.198.IP' && m.channel.name == '#Chewbotcca'
      topicsplit = m.channel.topic.split(' ')
      topicsplit[10] = topicsplit[10].to_i - 1
      m.channel.topic = topicsplit.join(' ')
    else
      m.reply 'YOU ARENT NOTIFICO!!'
    end
  end
end
