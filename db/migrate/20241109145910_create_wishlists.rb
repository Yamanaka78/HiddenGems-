class CreateWishlists < ActiveRecord::Migration[7.2]
  def change
    create_table :wishlists do |t|
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true

      t.timestamps
    end
    add_index :wishlists, [ :user_id, :spot_id ], unique: true
  end
end
