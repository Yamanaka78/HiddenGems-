class SpotsController < ApplicationController
  def index
    @q = Spot.ransack(params[:q])
    @spots = @q.result(distinct: true).includes(:user, :tags).order(params.dig(:q, :s) || "created_at desc")
    @tags = Tag.all
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = current_user.spots.build(spot_params)
    tags_list = params[:spot][:tag_names].split(",")
    if @spot.save
      @spot.add_tags_to_spot(tags_list)
      redirect_to root_path, success: t("defaults.flash_message.created", item: Spot.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_created", item: Spot.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @review = Review.new
    all_reviews = @spot.reviews.includes(:user).order(created_at: :desc)
    @reviews = all_reviews.limit(5)
    @reviews_count = all_reviews.size

    @public_plans = @spot.plans.where(public: true).limit(4)
  end

  def destroy
    spot = current_user.spots.find(params[:id])
    spot.destroy!
    redirect_to spots_path, success: t("defaults.flash_message.deleted", item: spot.model_name.human), status: :see_other
  end

  def wishlists
    @wishlists = current_user.wishlists.includes(:user).order(created_at: :desc)
  end

  def map
    @spot = Spot.find_by(id: params[:id])
    unless @spot
      redirect_to root_path, alert: "Spot not found"
    end
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :spot, :description, :address, images: [])
  end
end
