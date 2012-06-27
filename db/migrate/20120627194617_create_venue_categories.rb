class CreateVenueCategories < ActiveRecord::Migration
  def change
    create_table :venue_categories do |t|
      t.integer :category_id
      t.integer :foursquare_spot_id

      t.timestamps
    end
  end
end
