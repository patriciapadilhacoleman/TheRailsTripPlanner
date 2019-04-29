class TripsController < ApplicationController

  def index

    if logged_in?

      @trips = @user.trips
    else
      render :login
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
    binding.pry
    if @trip.save
      @user.trips << @trip
      redirect_to controller: 'trips', action: 'index'
    else
      render :new
    end
  end

  def update
    @trip = Trip.find(params[:id])
    binding.pry
    if @trip.update(trip_params)
      redirect_to trips_url
    else
      render :edit
    end
  end

  def destroy

    binding.pry
    @trip = Trip.find(params[:id]).destroy

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

  def create_days
     current_day = u.trips.find(2).days.create(date:'05062018', lodging_id: 1)
     # if a lodging is not determined, save the date w the not assigned id = 1
  end

end
