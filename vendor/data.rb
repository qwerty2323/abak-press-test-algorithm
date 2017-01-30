class Entry < Struct.new(:age, :salary, :height, :weight);end

module RawData
  def populate(data=[], number=10_000)
    number.times do |i|
      data << Entry.new(rand(100), rand(1000000.0), rand(200), rand(200))
    end
    data
  end
end

RawData.extend RawData
