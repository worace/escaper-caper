class AddUrlToFoursquareSpots < ActiveRecord::Migration
  def change
    add_column :foursquare_spots, :url, :string
  end
end
