class AddEmojiToIngredient < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :emoji, :string
    add_column :pastas, :emoji, :string
    add_column :sauces, :emoji, :string
  end
end
