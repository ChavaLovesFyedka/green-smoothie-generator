class RecipesController < ApplicationController
  # def index
  # 	@recipes = Recipe.all
  # end

    def index
      if params[:search].size == 0
       @recipes = []
     # elsif params[:search].--- if ailment not in db?
     #  @recipes = []
     # elsif params[:search].include(:ailment)
        flash[:error] = "Please enter an ailment."
      else
        # based on name that's passed in, look up ailment, then ask for its recipes - get recipes for particular affliction
        #want to have a case-insensitive find_by for ActiveRecord -- change find by to where method
        if affliction = Ailment.where("lower(name) = ?", params[:search].downcase).first
          randomly_selected_recipe = affliction.recipes.sample
        @recipe_name = randomly_selected_recipe.name
        @recipe_url = randomly_selected_recipe.url
        @recipe_description = randomly_selected_recipe.decription
        else
          flash[:error] = "Please enter an existing ailment."
        end
      end


      if params[:search].size == 0 || affliction.nil? # there's no recipes
        # flash[:error] = "Please enter an ailment."
        redirect_to '/'
      else
        respond_to do |format|
          format.html { render action: "show" }
          format.js
        end
      end
    end
  #end
end
