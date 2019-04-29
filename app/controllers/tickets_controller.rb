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

end
