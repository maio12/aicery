class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :products, through: :items

  def basket_price
    products.sum(:base_price_cents)
  end

  def basket_checkout
    items.pluck(:product_id, :quantity)
  end

  def supermarkets_by_total_matches
    ids = products.pluck(:id)
    Supermarket.joins(:products)
               .where(products: { id: ids })
               .group("supermarkets.id")
               .order(Arel.sql("count(supermarkets.id) DESC"))
  end

  def supermarkets_by_total_price
    ids = products.pluck(:id)
    Supermarket.joins(:products)
               .where(inventories: { product_id: ids })
               .group("supermarkets.id")
               .having("count(products.id) > #{ids.size / 1.4}")
               .order(Arel.sql("sum(inventories.price_cents)"))
  end

  def supermarkets_by_average_price
    ids = products.pluck(:id)
    Supermarket.joins(:products)
               .where(inventories: { product_id: ids })
               .group("supermarkets.id")
               .having("count(products.id) > #{ids.size / 1.4}")
               .order(Arel.sql("avg(products.base_price_cents)"))
  end

  def supermarkets_by_index_differencial
    ids = products.pluck(:id)
    Supermarket.joins(:products)
               .where(inventories: { product_id: ids })
               .group("supermarkets.id")
               .order(Arel.sql("avg(inventories.differencial)"))
  end

  def supermarkets_by_closest_distance(lat, lng)
    results = Supermarket.near([lat, lng], 50, units: :km)
      # nearbys = Supermarket.near(user, 50, :order => "distance")
      # bearing = nearbys.first.bearing # => 46.12
      # Geocoder::Calculations.compass_point(bearing)
    return results
  end
end
