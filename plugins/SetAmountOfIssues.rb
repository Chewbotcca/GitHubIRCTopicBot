class SetRepo
  include Cinch::Plugin

  match /~issues (.+)/
  match /~setrepo (.+)/, method: :setrepo

  def setrepo(m, repo)
    unless File.exist?('data.yaml')
      File.new('data.yaml', 'w+')
      exconfig = YAML.load_file('data.sample.yaml')
      File.open('data.yaml', 'w') { |f| f.write exconfig.to_yaml }
    end
    data = YAML.load_file('data.yaml')
    betterchannelname = m.channel.name[1..m.channel.name.length]
    repo = repo.split('/')
    author = repo[0]
    reponame = repo[1]
    require 'yaml'
    data[betterchannelname] = "https://api.github.com/repos/#{author}/#{reponame}"
    File.open('data.yaml', 'w') { |f| f.write data.to_yaml }
  end
end
