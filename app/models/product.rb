class Product < ApplicationRecord
  # @products = Product.pluck(:id).sort
  include PgSearch::Model
  pg_search_scope :search_by_name_and_brand,
                  against: [
                    [:name, 'A'],
                    [:brand, 'B']
                  ],
                  using: {tsearch: { prefix: true, normalization: 2 }

                  # trigram: {
                  #   word_similarity: true
                  # }

                }
  monetize :base_price_cents

  # @products = Product.pluck(:name).sort
  # mount_uploader :photo, PhotoUploader
end
