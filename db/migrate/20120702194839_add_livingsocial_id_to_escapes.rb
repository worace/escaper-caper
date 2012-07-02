class AddLivingsocialIdToEscapes < ActiveRecord::Migration
  def change
    add_column :escapes, :livingsocial_id, :string
  end
end
