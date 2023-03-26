class YelpService
  def self.conn
    Faraday.new(
      url: "https://api.yelp.com/v3/businesses/",
      params: {
        locale: 'en_US',
        limit: 20,
        radius: 20000,
        categories: 'foodtrucks'
      },
      headers: {
        authorization: "Bearer #{ENV['yelp_api']}",
        content_type: 'application/json'
      }
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_food_trucks(latitude, longitude)
    response = conn.get("search", {latitude: latitude, longitude: longitude})
    parse_json(response)
  end
end