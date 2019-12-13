class ItemsController < ApplicationController
  def create
    product = Product.find(params[:product])

    list_id = params[:list_id] || current_user.current_list_id
    list = List.find(list_id)
    # list.update(name: 'Your list')
    @item = Item.create(list: list, product: product)

    redirect_to root_path
  end

  def plus
    @item = Item.find(params[:item_id])
    amount = @item.quantity + 1
    @item.update(quantity: amount)

    respond_to do |format|
      format.js
      format.html { redirect_to edit_list_path(@item.list) }
    end
  end

  def minus
    @item = Item.find(params[:item_id])
    list = @item.list

    if @item.quantity == 1
      @item.quantity -= 1
      @item.delete
    else
      amount = @item.quantity - 1
      @item.update(quantity: amount)
    end

    respond_to do |format|
      format.js
      format.html { redirect_to edit_list_path(list) }
    end
  end
end
