class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :postal_code
      t.integer :rating

      t.timestamps
    end
  end
end
