class Issues
  include Cinch::Plugin

  match /\[IRC\] (.+)/, strip_colors: true
  match /~issues (.+)/, method: :issues

  def execute(m, args)
    splitargs = args.split(' ')
    if CONFIG['channels'].include?(m.channel.name)
      if splitargs[1] == 'opened' && splitargs[2] == 'issue'
        if "#{m.user.user}@#{m.user.host}" == "notifico@#{CONFIG['notifico']}"
          topicsplit = m.channel.topic.split(' ')
          location = topicsplit.index { |s| s.include?('Issues:') } + 1
          topicsplit[location] = topicsplit[location].to_i + 1
          m.channel.topic = topicsplit.join(' ')
        else
          m.reply 'YOU ARENT NOTIFICO!!'
        end
      end

      if splitargs[1] == 'closed' && splitargs[2] == 'issue'
        if "#{m.user.user}@#{m.user.host}" == "notifico@#{CONFIG['notifico']}"
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

  def issues(m, args)
    if CONFIG['ownerhost'] == m.user.host
      topicsplit = m.channel.topic.split(' ')
      location = topicsplit.index { |s| s.include?('Issues:') } + 1
      topicsplit[location] = args.to_i
      m.channel.topic = topicsplit.join(' ')
    else
      m.reply 'YOU ARENT OWNEr!??!!'
    end
  end
end
