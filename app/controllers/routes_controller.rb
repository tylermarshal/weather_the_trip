class RoutesController < ApplicationController

  def create
    @route = Route.new(destination_id: params[:destination_id], trip_id: current_trip.id)
    if @route.save
      flash.notice = "Destination Added to Trip"
      redirect_back(fallback_location: destinations_path)
    end
  end

  def destroy
    route = Route.find_by(destination_id: params[:destination_id], trip_id: current_trip.id)
    route.destroy
    flash.notice = "Destination Deleted from Trip"
    redirect_back(fallback_location: destinations_path)
  end

end
