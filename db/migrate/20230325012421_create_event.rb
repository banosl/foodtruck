class CreateEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :food_truck, foreign_key: true
      t.string :event_date
      t.integer :latitude
      t.integer :longitude
      t.string :start_time
      t.string :end_time
      t.text :description

      t.timestamps
    end
  end
end
