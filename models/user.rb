class User
  attr_reader :id, :mention, :last_name, :first_name, :email

  def initialize(row)
    @id, @mention, @last_name, @first_name, @email  = row
  end

end
