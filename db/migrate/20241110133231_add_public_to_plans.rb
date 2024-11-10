# db/migrate/YYYYMMDDHHMMSS_add_public_to_plans.rb
class AddPublicToPlans < ActiveRecord::Migration[7.2]
  def change
    add_column :plans, :public, :boolean, default: false, null: false
  end
end
