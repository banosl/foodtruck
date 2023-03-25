require 'rails_helper'

RSpec.describe FoodTruck, type: :model do
  describe "associations" do
    it { should have_many(:events) }
  end

  describe "validations" do
    describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cuisine_type }
      it { should validate_presence_of :web_link }
      it { should validate_presence_of :image_link }
    end
  end
end
