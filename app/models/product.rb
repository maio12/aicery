class Product < ApplicationRecord
  @products = Product.pluck(:name).sort
  mount_uploader :photo, PhotoUploader
end
