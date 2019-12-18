class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_list

def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end

  private

  def set_list
    @cart_list = if current_user.nil?
                  nil
                elsif params[:list_id].present?
                  List.find(params[:list_id])
                else
                  current_user.current_list
                end
  end
end
