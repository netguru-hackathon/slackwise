#!/bin/ruby

require_relative './context'
require_relative './command_parser'

puts "Enter your username:"
current_user = STDIN.readline.chop
puts "Hello #{current_user}!"

context = Slackwise::Context.new(current_user)
command_parser = Slackwise::CommandParser.new(context)

loop do
  command = STDIN.readline.chop
  next if command.empty?

 command_words = command.split(' ')
 command_parser.public_send(command_words[0], command_words[1..-1])

 break if command.start_with?('exit')
end
