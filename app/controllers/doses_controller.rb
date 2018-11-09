class DosesController < ApplicationController
  def update
    cocktail = Cocktail.find(params[:cocktail_id])
    dose = Dose.find(params[:id])
    dose.description = params[:dose][:description]
    dose.save
    redirect_to cocktail_path(cocktail)
  end
end
