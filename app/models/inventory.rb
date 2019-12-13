class Inventory < ApplicationRecord
  belongs_to :supermarket
  belongs_to :product

  validates :product, uniqueness: { scope: :supermarket }
end
