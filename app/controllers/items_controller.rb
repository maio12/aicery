class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def create
    product = Product.find(params[:product])

    list = current_user.current_list
    # list.update(name: 'Your list')
    @item = Item.create(list: list, product: product)


    redirect_to root_path
  end

  def update
    @item = Item.find(params[:id])
    @item.update(bought: @item.mark_as_complete)
    redirect_to request.referer
  end

  def plus
    @item = Item.find(params[:item_id])
    amount = @item.quantity + 1
    @item.update(quantity: amount)

    respond_to do |format|
      format.js
      format.html { redirect_to list_path(@item.list) }
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
      format.html { redirect_to list_path(list) }
    end
  end


  def destroy
    puts "hello item"
    @item = Item.find(params[:id])
    @item.destroy
  end
end
