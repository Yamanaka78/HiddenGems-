# app/controllers/plans_controller.rb
class PlansController < ApplicationController

  def new
    @plan = Plan.new
    @wishlist_spots = current_user.wishlists.includes(:spot).map(&:spot)
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      spot_ids = params[:plan][:spot_ids].reject(&:blank?)
      spot_ids.each do |spot_id|
        order = params[:plan][:order][spot_id]
        visit_time = params[:plan][:visit_times][spot_id]
        transport_method = params[:plan][:transport_methods][spot_id]
        @plan.plan_spots.create(
          spot_id: spot_id,
          order: order,
          visit_time: visit_time,
          transport_method: transport_method
        )
      end
      flash[:success] = t("defaults.flash_message.created", item: Plan.model_name.human)
      redirect_to @plan
    else
      flash.now[:danger] = t("defaults.flash_message.not_created", item: Plan.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end



  private

  def plan_params
    params.require(:plan).permit(:plan_name, :description, :public)
  end
end
