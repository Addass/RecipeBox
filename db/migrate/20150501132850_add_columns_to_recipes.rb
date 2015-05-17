class AddColumnsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :category_id, :string
  end
end
