class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :price, :base_price
  end
end
