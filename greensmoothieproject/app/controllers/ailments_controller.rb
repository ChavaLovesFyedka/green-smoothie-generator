class AilmentsController < ApplicationController
  def index
  	@ailments = Ailment.all
  end

  def update
  	@ailment = Ailment.find(params[:id])
  end

end
