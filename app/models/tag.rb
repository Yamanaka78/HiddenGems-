class Tag < ApplicationRecord
  has_many :spot_tags, dependent: :destroy
  has_many :spots, through: :spot_tags
  validates :tag_name, presence: true, uniqueness: true


  # Ransackが利用できる属性を許可するメソッド
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "tag_name", "updated_at" ]
  end

  # 必要に応じて関連も許可
  def self.ransackable_associations(auth_object = nil)
    [ "spots" ]
  end
end
