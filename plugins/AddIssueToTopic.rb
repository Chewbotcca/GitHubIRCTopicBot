class AddIssueToTopic
  include Cinch::Plugin

  match /\[IRC\] (.+)/, strip_colors: :true, use_prefix: :false

  def execute(m, args)
    splitargs = args.split(' ')
    if splitargs[1] == 'opened'
      if "#{m.user.user}@#{m.user.host}" == 'notifico@ChewCraft-p8h.k4l.199.198.IP' && m.channel.name == '#Chewbotcca'
        topicsplit = m.channel.topic.split(' ')
        topicsplit[10] = topicsplit[10].to_i + 1
        m.channel.topic = topicsplit.join(' ')
      else
        m.reply 'YOU ARENT NOTIFICO!!'
      end
    end
  end
end
