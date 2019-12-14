class AddMonetizeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_monetize :products, :base_price, currency: { present: false }
  end
end
