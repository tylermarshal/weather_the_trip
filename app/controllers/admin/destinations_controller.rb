class Admin::DestinationsController < Admin::BaseController

    before_action :set_destination, only: [:edit, :update, :destroy]

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      flash.notice = "Created #{@destination.city}, #{@destination.state}"
      redirect_to destination_path(@destination)
    else
      flash.notice = "Please fill out all parts of the form correctly"
      render :new
    end
  end

  def edit
  end

  def update
    @destination.update(destination_params)
    @destination.save

    flash.notice = "Updated #{@destination.city}, #{@destination.state}"

    redirect_to destination_path(@destination)
  end

  def destroy
    @destination.destroy
    flash.notice = "Deleted #{@destination.city}, #{@destination.state}"

    redirect_to destinations_path
  end

private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name, :city, :state, :latitude, :longitude, :population, :term)
  end


end
