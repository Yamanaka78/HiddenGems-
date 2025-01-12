class AddNotesToPlans < ActiveRecord::Migration[7.2]
  def change
    add_column :plans, :notes, :string
  end
end
