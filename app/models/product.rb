class Product < ApplicationRecord
  # @products = Product.pluck(:id).sort
  include PgSearch::Model
  pg_search_scope :search_by_name_and_brand,
                  against: %i[name brand],
                  using: {
                    tsearch: { prefix: true }
                  }
  # @products = Product.pluck(:name).sort
  # mount_uploader :photo, PhotoUploader
end
