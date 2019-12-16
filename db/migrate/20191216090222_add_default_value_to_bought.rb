class AddDefaultValueToBought < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :bought, :boolean, default: false
  end
end
