class PurchasesController < ApplicationController
  def update
    @item = Item.find(params[:item_id])
    @item.mark_as_complete
    redirect_to root_path
  end
end
