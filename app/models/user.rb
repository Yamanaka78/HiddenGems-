class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :spots, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :wishlist_spots, through: :wishlists, source: :spot


  def own?(object)
    id == object&.user_id
  end

  def wishlist(spot)
    wishlist_spots << spot
  end

  def unwishlist(spot)
    wishlist_spots.destroy(spot)
  end

  def wishlist?(spot)
    wishlist_spots.include?(spot)
  end
end
