class CreateFoodTruck < ActiveRecord::Migration[5.2]
  def change
    create_table :food_trucks do |t|
      t.string :name
      t.string :cuisine_type
      t.string :web_link
      t.string :image_link

      t.timestamps
    end
  end
end
