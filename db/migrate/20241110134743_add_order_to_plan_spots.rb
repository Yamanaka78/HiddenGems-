class AddOrderToPlanSpots < ActiveRecord::Migration[7.2]
  def change
    add_column :plan_spots, :order, :integer
  end
end
