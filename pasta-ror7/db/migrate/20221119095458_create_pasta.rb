class CreatePasta < ActiveRecord::Migration[7.0]
  def change
    create_table :pasta do |t|
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
