class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @products = Product.search_by_name_and_brand(params[:query])
    else
      @products = []
    end
  end

  def profile
  end
end
