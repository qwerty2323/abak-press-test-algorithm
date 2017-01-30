require_relative "../vendor/data"

module SimpleSelection
  def data
    RawData.populate
  end

  def search(array=data, &block)
    array.select(&block)
  end
end
SimpleSelection.extend SimpleSelection
