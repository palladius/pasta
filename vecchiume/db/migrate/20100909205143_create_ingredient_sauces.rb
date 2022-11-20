class CreateIngredientSauces < ActiveRecord::Migration
  def self.up
    create_table :ingredient_sauces do |t|
      t.boolean :necessary, :default => true
      t.integer :sauce_id
      t.integer :ingredient_id
      t.text    :notes
      t.timestamps
    end
  end
  
  def self.down
    drop_table :ingredient_sauces
  end
end
