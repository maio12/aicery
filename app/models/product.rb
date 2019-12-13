class Product < ApplicationRecord
  # @products = Product.pluck(:id).sort
  include PgSearch::Model
  pg_search_scope :search_by_name_and_brand,
<<<<<<< HEAD
                  against: %i[name brand],
                  using: {
                    tsearch: { prefix: true }
                  }
    monetize :base_price_cents
=======
                  against: [
                    [:name, 'A'],
                    [:brand, 'B']
                  ],
                  using: {tsearch: { prefix: true, normalization: 2 }

                  # trigram: {
                  #   word_similarity: true
                  # }

                }

>>>>>>> master
  # @products = Product.pluck(:name).sort
  # mount_uploader :photo, PhotoUploader
end
