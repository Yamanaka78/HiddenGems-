# db/migrate/YYYYMMDDHHMMSS_create_plan_spots.rb
class CreatePlanSpots < ActiveRecord::Migration[7.2]
  def change
    create_table :plan_spots, id: false do |t|
      t.references :plan, null: false, foreign_key: true, index: true, type: :bigint
      t.references :spot, null: false, foreign_key: true, index: true, type: :bigint
      t.time :visit_time
      t.string :transport_method

      t.timestamps
    end

    add_index :plan_spots, [ :plan_id, :spot_id ], unique: true
  end
end
