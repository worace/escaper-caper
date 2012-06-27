class AddCurrentStateToFlickrPhotos < ActiveRecord::Migration
  def change
    add_column :flickr_photos, :current_state, :string
  end
end
