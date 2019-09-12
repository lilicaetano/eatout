class AddFoodPreferencesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :food_preferences, :string
  end
end
