class CreatePasta < ActiveRecord::Migration[7.0]
  def change
    create_table :pastas do |t|
      t.string :name
      t.text :description
      #t.boolean :active
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
