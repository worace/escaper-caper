class CreateEscapes < ActiveRecord::Migration
  def change
    create_table :escapes do |t|
      t.string :title
      t.text   :description
      t.string :venue
      t.string :details
      t.string :price
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :expiration
      t.timestamps
    end
  end
end
