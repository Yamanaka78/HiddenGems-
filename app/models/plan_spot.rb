class PlanSpot < ApplicationRecord
  belongs_to :plan
  belongs_to :spot

  validates :plan_id, presence: true
  validates :spot_id, presence: true
end
