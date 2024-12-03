class WishlistsController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    current_user.wishlist(@spot)
  end

  def destroy
    @spot = current_user.wishlists.find(params[:id]).spot
    current_user.unwishlist(@spot)
  end
end
