class CreateSauces < ActiveRecord::Migration[7.0]
  def change
    create_table :sauces do |t|
      t.string :name
      t.text :description
      t.boolean :active, :default => true
      t.string :color, :default => "rosso"

      t.timestamps
    end
  end
end
