require_relative '../models/event'
require_relative 'base_repository'
require 'csv'

class EventsRepository < BaseRepository
  attr_reader :path, :classname

  def initialize(path: 'db/events.csv', classname: Event)
    @path = path
    @classname = classname
  end

  def find_by_mention(mention)
    all.find { |record| record.mention.to_s == mention.to_s }
  end
end
