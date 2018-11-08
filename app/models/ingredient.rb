class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: true

  INGREDIENTS = []

  Ingredient.all.each do |ingredient|
    INGREDIENTS << ingredient
  end
end
