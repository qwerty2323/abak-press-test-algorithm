require_relative "../vendor/data"

module Binary
  def data(array=[])
    RawData.populate.sort_by { |i| i.age } if array.empty?
  end

  def search(value, array=data)
    mid = array.size/2
    n = array[mid]
    if n.age == value
      n
    elsif n.age < value
      search(value, array.drop(mid))
    elsif n.age > value
      search(value, array.take(mid))
    else
      "No results"
    end
  end
end

Binary.extend Binary
