class CreateIngredientSauces < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_sauces do |t|
      t.boolean :necessary, :default => true
      t.integer :sauce_id
      t.integer :ingredient_id
      t.text :notes

      t.timestamps
    end
  end
end
