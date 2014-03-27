class RecipesController < ApplicationController
  # def index
  # 	@recipes = Recipe.all
  # end

    def index
      if params[:search].nil?
       @recipes = []
      else
        # based on name that's passed in, look up ailment, then ask for its recipes - get recipes for particular affliction
        #want to have a case-insensitive find_by for ActiveRecord -- change find by to where method
        affliction = Ailment.where("lower(name) = ?", params[:search].downcase).first
          randomly_selected_recipe = affliction.recipes.sample
        @recipe_name = randomly_selected_recipe.name
      end



      respond_to do |format|
        format.html { render action: "show" }
        format.js
      end
    end
  #end
end
