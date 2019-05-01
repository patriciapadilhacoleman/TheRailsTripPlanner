class TripsController < ApplicationController

  def index

    if logged_in?

      @trips = @user.trips
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def show
    @trip = Trip.find(params[:id])

  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      @user.trips << @trip
      binding.pry

      redirect_to controller: 'trips', action: 'index'
    else

      render :new
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)

      # redirect_to trips_url
    else
      render :edit
    end
  end

  def destroy


    @trip = Trip.find(params[:id]).destroy
    flash[:notice] = "Trip deleted."

    redirect_to trips_url
  end

  private

  def trip_params
    params.require(:trip).permit(
      :name, :beg_date, :end_date, :budget
    )
  end
  def create_ticket
    u.trips.find(2).tickets.create(airline:'American')

  end



end
