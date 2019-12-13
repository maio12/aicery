class AddPriceToInventories < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :price, :integer
  end
end
