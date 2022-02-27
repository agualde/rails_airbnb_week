class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new
    @flat = Flat.find(params[:flat_id])
    @favorite.flats_id = @flat.id
    @favorite.users_id = current_user.id
    authorize @favorite
    @favorite.save!
    redirect_to flats_path(anchor: @flat.id)
  end

  def update
    @favorite = Favorite.find(params[:id])
    @flat = Flat.find(params[:flat_id])
    @favorite.flats_id = @flat.id
    @favorite.users_id = current_user.id
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
