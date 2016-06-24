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

    def list(args)
      records = context.event_repository.all
      user_records = records.find_all { |r| r.id_owner == context.current_user }
      debts = user_records.map(&:debts)
      debts = debts.join(" ").split(" ")

      hsh = Hash.new(0)
      users = debts.each_slice(2) do |user, cash|
        cash = cash.to_f
        hsh[user] += cash
      end

      puts "Users: #{hsh}"
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
