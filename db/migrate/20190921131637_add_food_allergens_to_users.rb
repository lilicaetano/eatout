class AddFoodAllergensToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :food_allergens, :string
  end
end
