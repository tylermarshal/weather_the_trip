class DestinationsController < ApplicationController

  before_action :set_destination, only: [:show]

  def index
    @destinations = if params[:term]
      Destination.search(params[:term])
      .paginate(:page => params[:page], :per_page => 30)
    else
      Destination.paginate(:page => params[:page], :per_page => 30)
    end
  end

  def show
  end

  private

    def set_destination
      @destination = Destination.find(params[:id])
    end

    def destination_params
      params.require(:destination).permit(:name, :city, :state, :latitude, :longitude, :population, :term)
    end

end
