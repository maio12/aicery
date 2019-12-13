class Inventory < ApplicationRecord
  belongs_to :supermarket
  belongs_to :product

  validates :product, uniqueness: { scope: :supermarket }
  monetize :price_cents
end
