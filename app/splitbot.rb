require 'slack-ruby-bot'
require_relative './context'
require_relative './command_parser'
require_relative '../app/repositories/users_repository'

class Splitbot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'add_expense' do |client, data, match|
    current_user = UsersRepository.new.find_by_id(data[:user])
    context = Slackwise::Context.new(current_user)
    command_parser = Slackwise::CommandParser.new(context)

    command = data[:text]

    command_words = command.split(' ')
    command_parser.public_send(command_words[0], command_words[1..-1])

    client.say(text: 'Expense sucesfully added', channel: data.channel)
  end
end

Splitbot.run
