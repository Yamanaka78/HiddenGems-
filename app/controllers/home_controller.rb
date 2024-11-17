class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @q = Spot.ransack(params[:q])
    @spots = @q.result(distinct: true).includes(:user, :tags).limit(10)
    @plans = Plan.where(public: true).includes(:user, :spots).order(created_at: :desc).limit(10)
  end
end
