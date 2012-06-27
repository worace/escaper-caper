class CreateFoursquareSpots < ActiveRecord::Migration
  def change
    create_table :foursquare_spots do |t|
      t.integer :escape_id

      t.string  :foursquare_id
      t.string  :name
      t.string  :latitude
      t.string  :longitude
      t.integer :checkins
      t.integer :tips

      t.timestamps
    end
  end
end
