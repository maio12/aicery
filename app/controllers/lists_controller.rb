class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])

    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
