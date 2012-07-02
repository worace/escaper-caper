class AddLivingsocialUrlToEscapes < ActiveRecord::Migration
  def change
    add_column :escapes, :livingsocial_url, :string
  end
end
