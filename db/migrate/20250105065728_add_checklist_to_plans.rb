class AddChecklistToPlans < ActiveRecord::Migration[7.2]
  def change
    add_column :plans, :checklist, :string
  end
end
