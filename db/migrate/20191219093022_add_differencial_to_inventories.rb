class AddDifferencialToInventories < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :differencial, :integer
  end
end
