require 'forwardable'
require 'securerandom'

module Slackwise
  class ExpensesHandler
    def initialize(context)
      @context = context
    end

    def add_expense_for(args)
      puts "add expense for #{args}"
      return if args.empty?

      event_name = args.shift

      arr = [id, current_user, event_name, args.join(" ")]
      puts "adding arr: #{arr}"
      context.event_repository.write(arr)
      puts "arr: #{arr} added"
    end

    def add_and_split_eq_expense_for(args)
      return if args.empty?

      event_name = args.shift
      debt = args.pop
      people = args
    end

    private

    attr_reader :context

    def current_user
      context.current_user
    end

    def id
      SecureRandom.uuid
    end
  end
end
