class RecipesController < ApplicationController
  # def index
  # 	@recipes = Recipe.all
  # end

    def index
    @recipes = Recipe.all
      if params[:search].nil?
       @recipes = []
      else
        quoted_search_terms = params[:search].split(",").collect do |ailment|
        "\"+#{ailment.strip}\""
      end.join(" ")

      @recipes = []
      begin
        @search = Recipe.search do
          fulltext quoted_search_terms do
            highlight :page_content
            minimum_match 1
          end
        end

        @recipes = @search.results
        @recipes << Recipe.first if @recipes.count == 0
      rescue
        @recipes = Recipe.all.sample(5)
      end
      @recipe_name = @recipes[0..4].collect(&:name).shuffle.first
      @recipe_url = Recipe.find_by(:name => @recipe_name).try(:url)

      respond_to do |format|
        format.html { render action: "index" }
        format.js
      end
    end
  end
end
