class Foodtruck
  attr_reader :name,
              :image_url,
              :url,
              :latitude,
              :longitude,
              :address,
              :phone
  def initialize(data)
    @name = data[:name]
    @image_url = data[:image_url]
    @url = data[:url]
    @latitude = data[:coordinates][:latitude]
    @longitude = data[:coordinates][:longitude]
    @address = format_address(data[:location][:display_address])
    @phone = data[:display_phone]
  end

  def format_address(display_address)
    display_address.join(", ")
  end
end