class Issues
  include Cinch::Plugin

  match /\[(.+)/, strip_colors: true
  match /~issues (.+)/, method: :issues

  def execute(m, args)
    splitargs = args.split(' ')
    unless CONFIG['channels'].include?(m.channel.name)
      m.reply "This channel isn't in the list of channels I'm authorized to modify. Please invite me. Leaving..."
      Channel(m.channel).part
      return
    end
    return unless splitargs[3] == 'issue'
    unless "#{m.user.user}@#{m.user.host}" == "notifico@#{CONFIG['notifico']}"
      m.reply 'Only a configured notifico! host can be used to modify the channel topic!'
      return
    end
    if splitargs[2] == 'opened'
      topicsplit = m.channel.topic.split(' ')
      location = topicsplit.index { |s| s.include?('Issues:') } + 1
      topicsplit[location] = topicsplit[location].to_i + 1
      m.channel.topic = topicsplit.join(' ')
    end

    if splitargs[2] == 'closed'
      topicsplit = m.channel.topic.split(' ')
      location = topicsplit.index { |s| s.include?('Issues:') } + 1
      topicsplit[location] = topicsplit[location].to_i - 1
      m.channel.topic = topicsplit.join(' ')
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
