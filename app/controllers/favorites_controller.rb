class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new
    @flat = Flat.find(params[:flat_id])
    @favorite.flat = @flat
    @favorite.user = current_user
    authorize @favorite
    @favorite.save!
    redirect_to flats_path(anchor: @flat.id)
  end

  def update
    @favorite = Favorite.find(params[:id])
    @flat = Flat.find(params[:flat_id])
    @favorite.flat = @flat
    @favorite.user = current_user
    @favorite.toggle!(:favorite)
    authorize @favorite
    @favorite.save
    redirect_to flats_path(anchor: @flat.id)
  end

  private

  def favorite_params
    params.require(:favorites).permit(:id, :favorite)
  end
end
