class AddUserToFoodItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :food_items, :user, foreign_key: true

    add_index :food_items, [:name, :user_id], :unique => true
  end
end
