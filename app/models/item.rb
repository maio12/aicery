class Item < ApplicationRecord
  belongs_to :product
  belongs_to :list
  validates :product, uniqueness: { scope: :list }

  delegate :photo, to: :product
  delegate :name, to: :product
  delegate :quantity, to: :product, prefix: true
  delegate :unit, to: :product

  def complete?
    bought
  end

  def mark_as_complete
    @bought = true
  end

  def undo

  end

end
