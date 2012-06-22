class AddLatitudeAndLongitudeToEscapes < ActiveRecord::Migration
  def change
    add_column :escapes, :latitude, :string
    add_column :escapes, :longitude, :string
  end
end
