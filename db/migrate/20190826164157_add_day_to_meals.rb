class AddDayToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :day, :string
  end
end
