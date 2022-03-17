class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new
    @favorites = Favorite.where(user_id: current_user)
    @flat = Flat.find(params[:flat_id])
    @favorite.flat = @flat
    @favorite.user = current_user
    authorize @favorite
    @favorite.save!
    respond_to do |format|
      format.html { redirect_to flat_path(@flat)}
      format.text { render partial: 'shared/favouriteDelete', locals: { favorites: @favorites, flat: @flat }, formats: [:html] }
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorites = Favorite.where(user_id: current_user)
    @flat = Flat.find(params[:flat_id])
    @favorite.flat = @flat
    @favorite.user = current_user
    authorize @favorite
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to flat_path(@flat)}
      format.text { render partial: 'shared/favouriteCreate', locals: { flat: @flat, favorites: @favorites }, formats: [:html] }
    end
  end

  private

  def favorite_params
    params.require(:favorites).permit(:id, :favorite)
  end
end
  