class AddDetailsToPlans < ActiveRecord::Migration[7.2]
  def change
    add_column :plans, :start_date, :date
    add_column :plans, :end_date, :date
    add_column :plans, :budget, :integer, default: 0, null: false
    add_column :plans, :category, :integer, null: false, default: 0
    add_column :plans, :number_of_people, :integer, default: 1, null: false
    add_column :plans, :weather_link, :string
  end
end
