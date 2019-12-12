class Product < ApplicationRecord
  #@products = Product.pluck(:id).sort
   include PgSearch::Model
  pg_search_scope :search_by_name_and_brand,
    against: [ :name, :brand, :quantity ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  #@products = Product.pluck(:name).sort
  mount_uploader :photo, PhotoUploader
end
