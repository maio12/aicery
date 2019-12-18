class ListsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]
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
    @new_list = List.new
    @new_list.user = current_user
    @new_list.save
    current_user.update(current_list_id: @new_list.id)
    redirect_to lists_path
  end

  def create
    @list = List.new(name: params["list"]["name"])
    @list.user = current_user
    @list.save
    redirect_to lists_path, notice: "List created motherfucker"
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
