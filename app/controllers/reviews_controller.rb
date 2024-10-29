class ReviewsController < ApplicationController
  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new
  end
  def create
    review = current_user.reviews.build(review_params)

    if review.save
      redirect_to spot_path(review.spot), success: t('defaults.flash_message.created', item: Review.model_name.human)
    else
      redirect_to spot_path(review.spot), danger: t('defaults.flash_message.not_created', item: Review.model_name.human)
    end
  end

  private

  def review_params
    params.require(:review).permit(:review_content, images: []).merge(spot_id: params[:spot_id])
  end
end
