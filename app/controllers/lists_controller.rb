class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
  def index
    @lists = current_user.lists
  end
end
