class EventSerializer 
  include JSONAPI::Serializer
  attributes  :event_date, 
              :latitude, 
              :longitude, 
              :start_time, 
              :end_time, 
              :description

end
