class Recipe < ApplicationRecord
  validates :recipe_name, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 500}  
  validates :chef_id, presence: true
  belongs_to :chef
  default_scope -> { order(updated_at: :desc)}
end
