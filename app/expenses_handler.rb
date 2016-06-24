require 'forwardable'

module Slackwise
  class ExpensesHandler
    def add_expense_for(args)
      return if args.empty?

      event_name = args.shift

      args.each_slice(2) do |person, debt|
        puts "TODO Add expense for: #{person} #{debt}"
      end
    end

    def add_and_split_eq_expense_for(args)
      return if args.empty?

      event_name = args.shift
      debt = args.pop
      people = args
    end

    private
  end
end
