class CreateSpots < ActiveRecord::Migration[7.2]
  def change
    create_table :spots do |t|
      t.string :title, null: false
      t.string :spot, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
