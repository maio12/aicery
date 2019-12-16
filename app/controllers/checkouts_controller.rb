class CheckoutsController < ApplicationController
  def show
    @list = current_user.lists.find(params[:list_id])
    @product_ids = @list.products.pluck(:id)

    @supermarkets = @list.supermarkets_by_total_price

    @cheapest = @supermarkets.first

    @nearest = @supermarkets.fourth # fake nearest

    @supermarkets = [@cheapest, @nearest]

    if params[:lat].present?
      puts "hello"
    end

    @markers = @supermarkets.map do |supermarket|
      {
        lat: supermarket.latitude,
        lng: supermarket.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { supermarket: supermarket }),
        image_url: helpers.asset_url('3915754-48.png')
      }
    end

    @markers << user_marker
  end

  private

  def user_marker
    {}.tap do |hash|
      hash[:lat] = params[:lat].presence
      hash[:lng] = params[:lng].presence
      hash[:image_url] = helpers.asset_url('3915754-48.png')
    end
  end
end

# def best_deal
#   list = List.find(params[:list_id])
#   product_items = current_user.lists.where(id: params[:list_id]).first.products

#   product_items.zip(Supermarket.all).each do |product, supermarket|
#     supermarket.products.each do |pr|
#       if product.id == pr
#         raise
#       end
#     end

#   end
# end
