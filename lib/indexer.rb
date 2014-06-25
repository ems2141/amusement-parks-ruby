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

  def index_hash(*args)
    keys = args
    state = keys.first.to_sym
    country = keys.last.to_sym

    result = {}
    @data.each do |data|
      new_key = "#{data[state]}, #{data[country]}"
      if result[new_key].nil?
        result[new_key] = [data]
      else
        result[new_key] << data
      end
    end
    result
  end
end