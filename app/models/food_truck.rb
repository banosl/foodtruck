class FoodTruck < ApplicationRecord
  validates_presence_of :name,
                        :cuisine_type,
                        :web_link,
                        :image_link

  has_many :events

end
