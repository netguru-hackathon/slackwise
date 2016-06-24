class Event
  attr_reader :id, :id_owner, :name, :depts

  def initialize(row)
    @id, @id_owner, @name, @depts = row
  end
end
