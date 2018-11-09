class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    @ingredient_ids = ingredients_params.reject { |i| i.empty? }
    @ingredient_ids.each do |ingredient|
      @ingredient_id = ingredient.to_i
      create_a_dose
    end
    redirect_to cocktails_path
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: params[:id])
  end

  def update_doses
    raise
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def ingredients_params
    params[:cocktail][:ingredient_ids]
  end

  def create_a_dose
    dose = Dose.new(description: 'Edit me!')
    dose.ingredient_id = @ingredient_id
    dose.cocktail_id = @cocktail.id
    dose.save
  end
end
