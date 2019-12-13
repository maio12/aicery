class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def show
    if params[:query].present?
      @products = Product.search_by_name_and_brand(params[:query])
    else
      @products = []
    end

    html = @products.map { |p| render_product(p) }

# byebug
    render json: html
  end

  private

  def render_product(product)
    render_to_string(
      partial: 'products/product',
      locals: { product: product }
    )
  end
end
