class RemoveIssueFromTopic
  include Cinch::Plugin

  match /\[IRC\] (.+)/, strip_colors: :true, use_prefix: :false

  def execute(m, args)
    splitargs = args.split(' ')
    if splitargs[1] == 'closed'
      if "#{m.user.user}@#{m.user.host}" == 'notifico@ChewCraft-p8h.k4l.199.198.IP' && m.channel.name == '#Chewbotcca'
        topicsplit = m.channel.topic.split(' ')
        location = topicsplit.index { |s| s.include?('Issues:') } + 1
        topicsplit[location] = topicsplit[location].to_i - 1
        m.channel.topic = topicsplit.join(' ')
      else
        m.reply 'YOU ARENT NOTIFICO!!'
      end
    end
  end
end
