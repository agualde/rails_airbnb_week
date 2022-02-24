class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index

    # if params[start: nil]
      @flats = policy_scope(Flat).order('created_at DESC')
      @markers = @flats.geocoded.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      # end
  #  else
  #   @flats = policy_scope(Flat).order('created_at DESC').where("start_date LIKE #{params[:start][0..4]}")
  #     @markers = @flats.geocoded.map do |flat|
  #       {
  #         lat: flat.latitude,
  #         lng: flat.longitude
  #       }

  #   end
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
    authorize @flat
  end

  def update
    @flat = Flat.find(params[:id])
    authorize @flat
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
    params.require(:flat).permit(:title, :description, :address, :capacity, :price, photos: [])
  end
end
