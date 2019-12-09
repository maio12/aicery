class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.integer :quantity
      t.integer :price
      t.string :unit
      t.string :photo

      t.timestamps
    end
  end
end
