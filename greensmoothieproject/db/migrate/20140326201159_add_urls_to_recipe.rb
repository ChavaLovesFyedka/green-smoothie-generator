class AddUrlsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :url, :string
  end
end
