class Product < ApplicationRecord
  @products = Product.pluck(:name).sort
end
