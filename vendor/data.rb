class Entry < Struct.new(:age, :salary, :height, :weight);end

class RawData
  def initialize(data = [])
    @data = data
  end
  
  def populate(number=10_000)
    number.times do |i|
      data << Entry.new(rand(100), rand(1000000.0), rand(200), rand(200))
    end
  end
end
