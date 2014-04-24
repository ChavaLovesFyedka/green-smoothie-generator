class Recipe < ActiveRecord::Base
	has_many :ailment_recipes
	has_many :ailments, through: :ailment_recipes

	#delegate :url, to: :recipe
end
