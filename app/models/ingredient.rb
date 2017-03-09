class Ingredient < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates_uniqueness_of :name
  has_many :recipe_ingredients
  has_many :recipe, through: :recipe_ingredients
end
