class Supermarket < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def nearby
    @supermarkets = Supermarket.near([params.fetch(:lng){ 0 }, params.fetch(:lat){ 0 }], params.fetch(:radius){ 20 })
  end

  def basket_total_price(ids)
    products.where(products: { id: ids })
          .sum("products.price")
  end

  def basket_average_price(ids)
    products.where(products: { id: ids })
          .average("products.price")
  end

  def total_matches(ids)
    products.where(products: { id: ids }).count
  end
end
