class SetAmountOfIssues
  include Cinch::Plugin

  match /~issues (.+)/

  def execute(m, args)
    if CONFIG['ownerhost'] == m.user.host
      topicsplit = m.channel.topic.split(' ')
      location = topicsplit.index { |s| s.include?('Open Issues:') } + 1
      topicsplit[location] = args.to_i
      m.channel.topic = topicsplit.join(' ')
    else
      m.reply 'YOU ARENT OWNEr!??!!'
    end
  end
end
