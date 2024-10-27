class CreateSpotTags < ActiveRecord::Migration[7.2]
  def change
    create_table :spot_tags do |t|
      t.references :spot, null: false, foreign_key: true, type: :bigint
      t.references :tag, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end

    # spot_idとtag_idの組み合わせをユニークに保つインデックス
    add_index :spot_tags, [:spot_id, :tag_id], unique: true
  end
end
