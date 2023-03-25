require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "associations" do
    it { should belong_to(:food_truck) }
  end

  describe "validations" do
    it { should validate_presence_of :food_truck_id }
    it { should validate_presence_of :event_date }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
    it { should validate_presence_of :description }
  end
end
