class TripsController < ApplicationController

  def create_ticket
    u.trips.find(2).tickets.create(airline:'American')

  end

  def create_days
     current_day = u.trips.find(2).days.create(date:'05062018', lodging_id: 1)
     # if a lodging is not determined, save the date w the not assigned id = 1
  end

end
