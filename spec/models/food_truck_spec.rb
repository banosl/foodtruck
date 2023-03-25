require 'rails_helper'

RSpec.describe FoodTruck, type: :model do
  it { should have_many(:events) }

end