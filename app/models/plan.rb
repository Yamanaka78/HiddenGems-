class Plan < ApplicationRecord
  belongs_to :user
  has_many :plan_spots, dependent: :destroy
  has_many :spots, through: :plan_spots

  validates :plan_name, presence: true
end
