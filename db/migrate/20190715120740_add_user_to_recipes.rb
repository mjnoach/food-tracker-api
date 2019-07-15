class AddUserToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :user, foreign_key: true

    add_index :recipes, [:name, :user_id], :unique => true
  end
end
