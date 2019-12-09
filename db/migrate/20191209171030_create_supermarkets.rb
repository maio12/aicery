class CreateSupermarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :supermarkets do |t|
      t.string :chain
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
