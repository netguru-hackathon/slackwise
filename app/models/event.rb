class Event
  attr_reader :id, :id_owner, :name, :debts

  def initialize(row)
    @id, @id_owner, @name, @debts = row
  end
end
