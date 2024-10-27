class SpotTag < ApplicationRecord
  belongs_to :spot
  belongs_to :tag

  # spot_idとtag_idの組み合わせが一意であることを検証
  validates :spot_id, uniqueness: { scope: :tag_id }
end
