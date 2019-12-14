class Supermarket < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  def basket_total_price(ids)
    inventories.where(inventories: { product_id: ids })
               .sum("inventories.price")
  end

  def basket_average_price(ids)
    inventories.where(inventories: { product_id: ids })
          .average("inventories.price")
  end

  def total_matches(ids)
    inventories.where(inventories: { product_id: ids }).count
  end
end
