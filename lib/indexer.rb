class Indexer
  def initialize(data)
    @data = data
  end

  def to_hash(index_by)
    result = {}
    @data.each do |data|
      new_key = data[index_by.to_sym]
      if result[new_key].nil?
      result[new_key] = [data]
      else
      result[new_key] << data
      end
    end
    result
  end
end