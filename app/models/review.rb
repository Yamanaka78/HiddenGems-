class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  has_many_attached :images
end
