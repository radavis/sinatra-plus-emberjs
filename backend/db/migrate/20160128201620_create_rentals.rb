class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :title, null: false
      t.string :owner
      t.string :city, null: false
      t.string :type
      t.integer :bedrooms, null: false
      t.text :image
      t.timestamps null: false
    end
  end
end
