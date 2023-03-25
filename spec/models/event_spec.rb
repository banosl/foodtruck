require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:food_truck) }

end
