class Supermarket < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories
end
