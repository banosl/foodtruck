class FoodtruckFacade
  def self.get_place_search_details(query)
    results = GoogleMapsPlacesService.find_place(query)
    Place.new(results[:candidates].first)
  end

  def self.foodtrucks_in_radius(place)

  end
end