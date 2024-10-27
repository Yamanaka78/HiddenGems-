class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.string :tag_name, null: false
      t.timestamps
    end
  end
end
