require_relative '../models/user'
require_relative 'base_repository'
require 'csv'

class UsersRepository < BaseRepository
  attr_reader :path, :classname

  def initialize(path: 'db/users.csv', classname: User)
    @path = path
    @classname = classname
  end

  def find_by_mention(mention)
    all.find { |record| record.mention.to_s == mention.to_s }
  end
end
