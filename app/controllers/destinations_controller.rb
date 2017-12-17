class DestinationsController < ApplicationController

  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = Destination.all
    # @destinations = Destination.paginate(:page => params[:page], :per_page => 30)
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.create(destination_params)
    if @destination.save
      flash.notice = "Created #{@destination.name}"

      redirect_to destination_path(@destination)
    else
      flash.notice = "Please fill out all parts of the form"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @destination.update(destination_params)
    @destination.save

    flash.notice = "Updated #{@destination.name}"

    redirect_to destination_path(@destination)
  end

  def destroy
    @destination.destroy
    flash.notice = "Deleted #{@destination.name}"
  end

  private

    def set_destination
      @destination = Destination.find(params[:id])
    end

    def destination_params
      params.require(:destination).permit(:name, :city, :state, :latitude, :longitude)
    end

end
