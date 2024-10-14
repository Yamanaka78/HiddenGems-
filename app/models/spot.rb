class Spot < ApplicationRecord
  # バリデーションの追加
  validates :title, presence: true, length: { maximum: 30 }
  validates :spot, presence: true
  validates :description, presence: true, length: { maximum: 9999 }
  validates :tag, length: { maximum: 30 }, allow_blank: true


  belongs_to :user
end
