class CreateSpots < ActiveRecord::Migration[7.2]
  def change
    create_table :spots do |t|
      t.string :spot_image
      t.string :title, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :visit_year, null: false
      t.integer :visit_month, null: false
      t.integer :visit_day, null: false
      t.integer :purpose, null: false, default: 0
      t.timestamps
    end
  end
end
