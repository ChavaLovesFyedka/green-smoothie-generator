class CreateAilmentRecipes < ActiveRecord::Migration
  def change
    create_table :ailment_recipes do |t|
      t.references :ailment, index: true
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
