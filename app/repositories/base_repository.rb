class BaseRepository
  def write(row)
    CSV.open(path, "ab") { |csv| csv << row }
  end

  def all
    array_of_records.map { |row| Object.const_get("::#{classname}").new(row) }
  end

  def find_by_id(id)
    all.find { |record| record.id.to_s == id.to_s }
  end

  private

  def array_of_records
    CSV.read(path)
  end
end
