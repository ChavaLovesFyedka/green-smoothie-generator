class AilmentsController < ApplicationController
  def index
  	@ailments = Ailment.all
  end
end
