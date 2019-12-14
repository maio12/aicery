class RemovePriceFromInventories < ActiveRecord::Migration[5.2]
  def change
    remove_column :inventories, :price, :integer
  end
end
