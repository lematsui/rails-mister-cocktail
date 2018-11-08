class CocktailsController < ApplicationController
  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient::INGREDIENTS.map do |ingredient|
      ingredient.name.capitalize
    end
  end

  def create
    cocktail = Cocktail.create(name: params[:cocktail][:name])
    ingredients = []
    params[:cocktail][:ingredients].each do |ingredient|
      ingredients << Ingredient.create(name: ingredient)
    end

    dose.create(description: params[:cocktail][:doses], cocktail_id: cocktail.id)
  end
end
