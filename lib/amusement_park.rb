class AmusementPark
  def initialize(data)
    @data = data
  end

  def to_hash
    result = {}
    new_key = @data.first[:id]
    result[new_key] = @data.first
    result
  end
end