class SpotsController < ApplicationController
  def index
    @spots = Spot.includes(:user)
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      redirect_to root_path, success: t("defaults.flash_message.created", item: Spot.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_created", item: Spot.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end


  private


  def spot_params
    params.require(:spot).permit(:spot_image, :title, :spot, :description, images: [])
  end
end
