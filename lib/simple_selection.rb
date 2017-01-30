require_relative "../vendor/data"

module SimpleSelection
  def data
    RawData.populate
  end

  def search(&block)
    data.select(&block)
  end
end
SimpleSelection.extend SimpleSelection
