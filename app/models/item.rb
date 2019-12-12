class Item < ApplicationRecord
  belongs_to :product
  belongs_to :list

  delegate :photo, to: :product
  delegate :name, to: :product
  delegate :quantity, to: :product, prefix: true
  delegate :unit, to: :product
end
