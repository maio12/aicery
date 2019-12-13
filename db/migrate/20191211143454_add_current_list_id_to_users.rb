class AddCurrentListIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :current_list, index: true, foreign_key: { to_table: :lists }
  end
end
