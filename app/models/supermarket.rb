class Supermarket < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def nearby
    @supermarkets = Supermarket.near([params.fetch(:lng){ 0 }, params.fetch(:lat){ 0 }], params.fetch(:radius){ 20 })
  end

  def basket_total_price(ids)
    total = inventories.where(inventories: { product_id: ids })
                       .sum("inventories.price_cents")
    Money.new(total)
  end

  def basket_average_price(ids)
    total = inventories.where(inventories: { product_id: ids })
                       .average("inventories.price_cents")
     Money.new(total)
  end

  def total_matches(ids)
    inventories.where(inventories: { product_id: ids }).count
  end
end
