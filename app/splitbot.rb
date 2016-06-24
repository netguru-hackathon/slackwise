require 'slack-ruby-bot'

class Splitbot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

Splitbot.run
