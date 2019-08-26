class AddUserToMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :user, foreign_key: true

    add_index :meals, [:id, :user_id], :unique => true
  end
end
