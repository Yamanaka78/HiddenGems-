class Spot < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :spot_tags, dependent: :destroy
  has_many :tags, through: :spot_tags
  has_many :reviews, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :users_in_wishlist, through: :wishlists, source: :user
  has_many :plan_spots, dependent: :destroy
  has_many :plans, through: :plan_spots


  # バリデーションの追加
  validates :title, presence: true, length: { maximum: 30 }
  validates :spot, presence: true
  validates :description, presence: true, length: { maximum: 9999 }
  # validates :tag, length: { maximum: 30 }, allow_blank: true
  validate :image_content_type
  validate :image_size

  def image_content_type
    if images.attached?
      images.each do |image|
        if !image.content_type.in?(%w[image/jpeg image/png image/gif])
          errors.add(:image, "：ファイル形式が、JPEG, PNG, GIF以外になってます。ファイル形式をご確認ください。")
        end
      end
    end
  end

  def image_size
    if images.attached?
      images.each do |image|
        if image.blob.byte_size > 1.megabytes
          errors.add(:image, "：1MB以下のファイルをアップロードしてください。")
        end
      end
    end
  end

  def add_tags_to_spot(spot_tags)
    spot_tags.each do |new_name|
      spot_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << spot_tag
    end
  end


  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "id", "spot", "title", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "tags", "reviews" ]
  end
end
