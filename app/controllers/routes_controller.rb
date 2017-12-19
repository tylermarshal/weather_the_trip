class RoutesController < ApplicationController

  def create
    @route = Routes.new(destination_id: params[:destination_id], trip_id: current_trip.id)
    if @route.save
      flash.notice = "Destination Added to Trip"
      redirect_to destinations_path
    end
  end

  def destroy
    route = Routes.find_by(destination_id: params[:destination_id], trip_id: current_trip.id)
    route.destroy
    flash.notice = "Destination Deleted from Trip"
    redirect_back(fallback_location: destinations_path)
  end

end
