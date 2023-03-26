class Place
  attr_reader :name,
              :address,
              :latitude,
              :longitude

  def initialize(data)
    @name = data[:name]
    @address = data[:formatted_address]
    @latitude = data[:geometry][:location][:lat]
    @longitude = data[:geometry][:location][:lng]
  end
end