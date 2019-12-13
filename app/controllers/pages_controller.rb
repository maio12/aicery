class PagesController < ApplicationController

  def home
    @products = Product.pluck(:name)
  end
  def profile
  end
end
