class FoodTruckSerializer
  include JSONAPI::Serializer
  attributes  :name, 
              :cuisine_type, 
              :web_link, 
              :image_link, 
              :events

  has_many :events
  
end
