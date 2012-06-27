class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :icon_url
      t.string :name
      t.string :plural_name
      t.string :short_name
      t.string :foursquare_id
      t.boolean :primary

      t.timestamps
    end
  end
end
