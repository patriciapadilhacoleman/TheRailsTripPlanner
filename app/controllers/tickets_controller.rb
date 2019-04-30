class TicketsController < ApplicationController

  def index

    if params[:trip_id]
      @tickets = Trip.find(params[:trip_id]).tickets
    else
      @tickets = Ticket.all
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end


    def new

        @ticket = Ticket.new(trip_id: params[:trip_id])
    end

    def edit
      @ticket = Ticket.find(params[:id])
    end

    def create

      @ticket = Ticket.new(ticket_params)

      if @ticket.save
        redirect_to trip_path(current_trip_id), alert: "Ticket added."
      else
        render :new
      end
  end

    def update
      @ticket = Ticket.find(params[:id])
    
      if @ticket.update(ticket_params)
        redirect_to trip_path(current_trip_id), alert: "Ticket updated."
      else
        render :edit
      end
    end

    def destroy

      binding.pry
      @ticket = Ticket.find(params[:id]).destroy
      flash[:notice] = "Ticket deleted."
      redirect_to trip_path(current_trip_id), alert: "Ticket added."
    end


  private

  def ticket_params
    params.require(:ticket).permit(
      :dep_airport, :dep_time, :arr_airport, :arr_time, :price, :airline, :reservation, :trip_id
    )
  end

  def current_trip_id
    binding.pry
    @trip = Trip.find(params[:ticket][:trip_id])
    @trip.id

  end


end
