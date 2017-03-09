class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :substitute
    end
  end
end
