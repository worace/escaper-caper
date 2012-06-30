class AddIconUrlToParentCategories < ActiveRecord::Migration
  def change
    add_column :parent_categories, :icon_url, :string
  end
end
