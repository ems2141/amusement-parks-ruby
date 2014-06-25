class AmusementPark
  def initialize(data)
    @data = data
  end

  def to_hash
    result = {}
    @data.each do |data|
      new_key = data[:id]
      result[new_key] = data
    end
    result
  end
end