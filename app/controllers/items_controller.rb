class ItemsController < ApplicationController
  def update_plus
    @item = Item.find(params[:id])
    @item.quantity += 1
    @item.save
    redirect_to edit_list_path(@item.list)
  end

  def update_minus
    @item = Item.find(params[:id])
    if @item.quantity.zero?
      @item.delete
    else
      @item.quantity -= 1
    end
    @item.save
    redirect_to edit_list_path(@item.list)
  end
end
