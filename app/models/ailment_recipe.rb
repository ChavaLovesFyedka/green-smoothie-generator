class AilmentRecipe < ActiveRecord::Base
  belongs_to :ailment
  belongs_to :recipe
end
