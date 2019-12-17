class CheckoutsController < ApplicationController
  def show
    @list = current_user.lists.find(params[:list_id])
    @product_ids = @list.products.pluck(:id)

    @supermarkets = @list.supermarkets_by_total_price

    @cheapest = @supermarkets.first

    if !params["lat"].present?


      @marker_cheapest =
        {
          lat: @cheapest.latitude,
          lng: @cheapest.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { supermarket: @cheapest }),
          image_url: helpers.asset_url('moneycart.png')

        }

    else
      lat = params["lat"]
      lng = params["lng"]
      @nearest = @list.supermarkets_by_closest_distance(lat,lng).first

      @marker_nearest =
        {
          lat: @nearest.latitude,
          lng: @nearest.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { supermarket: @nearest }),
          image_url: helpers.asset_url('fastcart.png')
        }

      @marker_cheapest =
        {
          lat: @cheapest.latitude,
          lng: @cheapest.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { supermarket: @cheapest }),
          image_url: helpers.asset_url('moneycart.png')
        }

      @marker_user = {
        lat: lat,
        lng: lng,
        image_url: helpers.asset_url('userlocation.png')
        # infoWindow: render_to_string(partial: "info_window", locals: { supermarket: @cheapest }),
        # image_url: helpers.asset_url('3915754-48.png')
      }
      # else
      # @marker_cheapest = true
      # @marker_nearest && @marker_user = false

    end
  end

end
