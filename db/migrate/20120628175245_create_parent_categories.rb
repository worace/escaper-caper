class CreateParentCategories < ActiveRecord::Migration
  def change
    create_table :parent_categories do |t|
      t.string :name
      t.string :display_name

      t.timestamps
    end
  end
end
