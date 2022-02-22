class FlatsController < ApplicationController

  def index
    # First we filter by available booking start and end dates from the params and render all them flats
    @flats = Flat.find_by(params[LO QUE LE METAMOS])
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.users_id = current_user.id
    if @flat.save
      # redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat.id)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    # Redirect_to dashbord_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :images, :address, :capacity, :price)
  end
end
