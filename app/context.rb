require 'forwardable'
require_relative './expenses_handler'
require_relative './repositories/events_repository'

module Slackwise
  class Context
    extend Forwardable

    attr_reader :current_user

    delegate [:add_expense_for, :add_and_split_eq_expense_for] => :expenses_handler

    def initialize(current_user)
      @current_user = current_user
      @expenses_handler = ExpensesHandler.new(self)
    end

    def event_repository
      @event_repository ||= ::EventsRepository.new
    end

    private

    attr_reader :expenses_handler
  end
end
