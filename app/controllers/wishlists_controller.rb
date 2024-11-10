class WishlistsController < ApplicationController
  def create
    spot = Spot.find(params[:spot_id])
    current_user.wishlist(spot)
    redirect_to spots_path, success: t('.success')
  end

  def destroy
    spot = current_user.wishlists.find(params[:id]).spot
    current_user.unwishlist(spot)
    redirect_to spots_path, success: t('.success'), status: :see_other
  end
end
