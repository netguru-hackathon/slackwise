require 'forwardable'

module Slackwise
  class CommandParser
    def initialize(context)
      @context = context
    end

    def add_expense(args)
      Integer(args[2])
      context.add_expense_for(args)
    rescue ArgumentError => e
      context.add_and_split_eq_expense_for(args)
    end

    def ae(args)
      add_expense(args)
    end

    private

    attr_reader :context

    def method_missing(*args)
      puts "Command not found \"#{args.first}\""
    end
  end
end
