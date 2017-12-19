class TripsController < ApplicationController

  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = current_user.trips.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
      flash.notice = "Trip #{@trip.name} has been started."
      session[:trip_id] = @trip.id

      redirect_to user_trip_path(current_user, @trip)
    else
      flash.notice = "Please enter all of the information require to start a trip."
      render :new
    end
  end

  def edit
    session[:trip_id] = @trip.id

    redirect_to destinations_path
  end

  def update
    @trip.update(trip_params)
    if @trip.save
      flash[:success] = "#{@trip.name} updated!"
      redirect_to user_trip_path(current_user, @trip)
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy

    flash.notice = "Trip #{@trip.name} has been delete."
    redirect_to user_trips_path(current_user)
  end

  private

    def set_trip
      @trip = current_user.trips.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:name)
    end
end
