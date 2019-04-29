class DaysController < ApplicationController

  def index

    if logged_in?

      @days = @user.days
    else
      render :login
    end
  end

  def show
    @day = Day.find(params[:id])
  end

  def new
    @day = Day.new
  end

  def edit
    @day = Day.find(params[:id])
  end

  def create
    @day = Day.new(day_params)
    binding.pry
    if @day.save
      @user.days << @day
      redirect_to controller: 'days', action: 'index'
    else
      render :new
    end
  end

  def update
    @day = Day.find(params[:id])
    binding.pry
    if @day.update(day_params)
      redirect_to days_url
    else
      render :edit
    end
  end

  def destroy

    binding.pry
    @day = Day.find(params[:id]).destroy

    redirect_to days_url
  end

  private

  def day_params
    params.require(:day).permit(
      :name, :beg_date, :end_date, :budget
    )
  end
  def create_ticket
    u.days.find(2).tickets.create(airline:'American')

  end

  def create_days
     current_day = u.days.find(2).days.create(date:'05062018', lodging_id: 1)
     # if a lodging is not determined, save the date w the not assigned id = 1
  end

end
