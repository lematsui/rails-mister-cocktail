class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :ingredient_id, uniqueness: { scope: :cocktail_id }

  DOSES = []

  Dose.all.each do |dose|
    DOSES << dose
  end
end
