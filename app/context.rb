require 'forwardable'
require_relative './expenses_handler'

module Slackwise
  class Context
    extend Forwardable

    delegate [:add_expense_for, :add_and_split_eq_expense_for] => :expenses_handler

    def initialize(current_user)
      @current_user = current_user
      @expenses_handler = ExpensesHandler.new
    end

    private

    attr_reader :current_user, :expenses_handler
  end
end
