class FlatsController < ApplicationController

  def index
    # First we filter by available booking start and end dates from the params and render all them flats
    @flats = policy_scope(Flat)
  end

  def show
    authorize @flat
    @flat = Flat.find(params[:id])
  end

  def new
    authorize @flat
    @flat = Flat.new
  end

  def create
    authorize @flat
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to dashboard_index_path
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
    redirect_to dashbord_index_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :images, :address, :capacity, :price)
  end
end
