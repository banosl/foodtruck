class FoodtruckFacade
  def self.get_coordinates(place)
    results = GoogleMapsPlacesService.find_place(place)
    binding.pry
  end

  def self.foodtrucks_in_radius(place)

  end
end