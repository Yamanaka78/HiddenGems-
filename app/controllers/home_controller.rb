class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @spots = Spot.includes(:user, :tags).limit(10)
  end
end
