require_relative "../vendor/data"

module Binary
  def data(array=[])
    RawData.populate.sort_by { |i| i.age } if array.empty?
  end

  def search(value, array=data)
    mid = array.size/2
    puts 'found mid'
    n = array[mid]
    puts 'assigned n = array[mid].age'
    if n.age == value
      n
    elsif n.age < value
      puts 'passed first condition'
      search(value, array.drop(mid))
    elsif n.age > value
      puts 'passed second condition'
      search(value, array.take(mid))
    else
      "No results"
    end
  end
end

Binary.extend Binary
