class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :products, through: :items

  def basket_price
    products.each do |quantity|
      product_id * quantity
    end
    products.sum(:price)
  end

  def supermarkets_by_total_matches
    ids = products.pluck(:id)
    Supermarket.joins(:products)
               .where(inventories: { product_id: ids })
               .group("supermarkets.id")
               .order(Arel.sql("count(supermarkets.id) DESC"))
  end

  def supermarkets_by_total_price
    ids = products.pluck(:id)
    Supermarket.joins(:products)
               .where(inventories: { product_id: ids })
               .group("supermarkets.id")
               .having("count(products.id) > #{ids.size / 2}")
               .order(Arel.sql("sum(inventories.price)"))
  end

  def supermarkets_by_average_price
    ids = products.pluck(:id)
    Supermarket.joins(:products)
               .where(inventories: { product_id: ids })
               .group("supermarkets.id")
               .having("count(products.id) > #{ids.size / 2}")
               .order(Arel.sql("avg(inventories.price)"))
  end
end
