class SetTextColsForEscapes < ActiveRecord::Migration

  def change
    change_column :escapes, :description, :text, :limit => nil
    change_column :escapes, :details, :text, :limit => nil
  end
end
