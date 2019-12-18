class ShoppingsController < ApplicationController
  def show
    @list = List.find(params[:list_id])
    @supermarket = Supermarket.find(params[:id])
    @list_items = Inventory.where(product_id: @list.products.pluck(:product_id))
    @list_items_supermarkets = @list_items.where(supermarket: @supermarket )
    @ids_items_supermarkets = @list_items_supermarkets.pluck(:product_id)
  end
end

