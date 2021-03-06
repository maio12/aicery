class Supermarket < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # basket is an array of arrays [:id, :quantity]
  def basket_total_price(basket)
    total = basket.inject(0) do |sum, item|
      inventory = inventories.where(product_id: item.first).first
      inventory.nil? ? sum : sum + inventory.price_cents * item.last
    end
    Money.new(total)
  end

  def basket_average_price(ids)
    total = inventories.where(inventories: { product_id: ids })
                       .average("inventories.price_cents")
     Money.new(total)
  end

  def base_price_differencial(ids)
    inventories.where(inventories: { product_id: ids })
               .average("inventories.differencial")
  end

  def total_matches(ids)
    inventories.where(inventories: { product_id: ids }).count
  end

  def total_matches_name(name)
    inventories.where(inventories: { product_id: name })
  end
end
