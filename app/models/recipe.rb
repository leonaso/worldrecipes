class Recipe < ApplicationRecord
  validates :recipe_name, presence: true
  validates_uniqueness_of :recipe_name
  validates :description, presence: true, length: { minimum: 3, maximum: 500}  
  validates :chef_id, presence: true
  belongs_to :chef
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  default_scope -> { order(updated_at: :desc)}
  mount_uploader :image, ImageUploader
  #validates_processing_of :image
  #validate :image_size_validation
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
