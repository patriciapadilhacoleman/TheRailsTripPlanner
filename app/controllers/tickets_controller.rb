class TicketsController < ApplicationController

  def index
    binding.pry
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
      @ticket = Trip.new
    end

    def edit
      @ticket = Trip.find(params[:id])
    end

    def create
      @ticket = Trip.new(ticket_params)
      binding.pry
      if @ticket.save
        @trip.tickets << @ticket
        redirect_to controller: 'trip', action: 'show'
      else
        render :new
      end
  end

  private

  def ticket_params
    params.require(:ticket).permit(
      :name, :beg_date, :end_date, :budget
    )
  end


end
