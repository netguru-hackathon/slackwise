require_relative '../models/user'
require_relative 'base_repository'
require 'csv'

class UsersRepository < BaseRepository
  attr_reader :path

  def initialize(path: 'db/users.csv')
    @path = path
  end

  def write(row)
    CSV.open(path, "ab") do |csv|
      csv << row
    end
  end

  def all
    array.map { |row| ::User.new(row) }
  end

  def find_by_id(id)
    all.map{ |user| user if user.id.to_s == id.to_s }.compact.first
  end

  private

  def array
    arr_of_arrs = CSV.read(path)
  end

end
