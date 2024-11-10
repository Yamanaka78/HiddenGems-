# db/migrate/YYYYMMDDHHMMSS_create_plans.rb
class CreatePlans < ActiveRecord::Migration[7.2]
  def change
    create_table :plans do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :plan_name, null: false
      t.text :description

      t.timestamps
    end
  end
end
