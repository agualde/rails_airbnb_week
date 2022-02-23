class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # First we filter by available booking start and end dates from the params and render all them flats
    @flats = policy_scope(Flat).order('created_at DESC')
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    authorize @flat
    if @flat.save
      redirect_to dashboards_path
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
    authorize @flat

    redirect_to dashboards_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :images, :address, :capacity, :price)
  end
end
