class PassengersController < ApplicationController
  def index
    @passenger = Passenger.all
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
    #@trips = Trip.find_by()?????????

    if @passenger.nil?
      head :not_found
      return
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
      return
    else
    render :new
    return
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])

    if @passenger.nil?
      head :not_found
      return "Passenger not found"
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])
    if @passenger.nil?
      head :not_found
      return "Passenger not found"
    elsif @passenger.update(passenger_params)
      redirect_to passengers_path
      return
    else
    render :edit
    return
    end
  end

  def destroy

    @passenger = Passenger.find_by(id: params[:id])

    if @passenger.nil?
      head :not_found
      return
    end

    @passenger.destroy

    redirect_to passengers_path
    return
  end

private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_number)
  end

end
