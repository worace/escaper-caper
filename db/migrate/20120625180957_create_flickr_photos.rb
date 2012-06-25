class CreateFlickrPhotos < ActiveRecord::Migration
  def change
    create_table :flickr_photos do |t|
      t.integer :escape_id
      t.string  :url_med
      t.string  :flickr_id
      t.string  :title

      t.timestamps
    end
  end
end
