class GoogleMapsPlacesService
  def self.conn
    Faraday.new(
      url: "https://maps.googleapis.com/maps/api/place",
      params: {
        fields: 'formatted_address,name,geometry',
        inputtype: 'textquery',
        key: ENV['google_api_key']
      }
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_place(query)
    response = conn.get("findplacefromtext/json", {input: query})
    parse_json(response)
  end
end