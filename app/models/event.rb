class Event < ApplicationRecord
  validates_presence_of :food_truck_id,
                        :event_date,
                        :latitude,
                        :longitude,
                        :start_time,
                        :end_time,
                        :description
                        
  belongs_to :food_truck

end
