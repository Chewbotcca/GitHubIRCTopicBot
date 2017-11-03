class Update
  include Cinch::Plugin

  match /update (.+)/, method: :update

  def update(m, update)
    if update == 'issues'
      data = YAML.load_file('data.yaml')
      begone = m.channel.name[1..m.channel.name.length]
      issue = JSON.parse(RestClient.get("#{data[begone]}"))['open_issues']
      topicsplit = m.channel.topic.split(' ')
      location = topicsplit.index { |s| s.include?('Issues:') } + 1
      topicsplit[location] = issue
      m.channel.topic = topicsplit.join(' ')
    end
  end
end
