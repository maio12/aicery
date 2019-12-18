class CheckoutsController < ApplicationController
  def show
    @list = current_user.lists.find(params[:list_id])
    @product_ids = @list.products.pluck(:id)

    @supermarkets = @list.supermarkets_by_total_price

    @cheapest = @supermarkets.first

    if @cheapest.present?
      @marker_cheapest =
        {
          lat: @cheapest.latitude,
          lng: @cheapest.longitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { supermarket: @cheapest }),
          image_url: helpers.asset_url('pin-giallo-01.png')

        }
    end

    lat = params["lat"]
    lng = params["lng"]

    if lat.present? && lng.present?
      @nearest = @list.supermarkets_by_closest_distance(lat,lng).first

      @marker_nearest = {
        lat: @nearest.latitude,
        lng: @nearest.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { supermarket: @nearest }),
        image_url: helpers.asset_url('pin-rosso-01.png')
      }

      @marker_user = {
        lat: lat,
        lng: lng,
        image_url: helpers.asset_url('mirino-01.png'),
        infoWindow: render_to_string(partial: "user_info_window", locals: { user: current_user }),
        # infoWindow: render_to_string(partial: "info_window", locals: { supermarket: @cheapest }),
        # image_url: helpers.asset_url('3915754-48.png')
      }

    end
  end
end
