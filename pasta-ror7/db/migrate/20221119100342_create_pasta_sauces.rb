class CreatePastaSauces < ActiveRecord::Migration[7.0]
  def change
    create_table :pasta_sauces do |t|
      t.boolean :appropriate, :default => true
      t.integer :vote, :default => 50
      t.text :notes
      t.integer :pasta_id
      t.integer :sauce_id

      #t.add_index  [:sauce_id]
      #t.add_index  [:pasta_id]

      t.timestamps
    end

    add_index :pasta_sauces, [:sauce_id]
    add_index :pasta_sauces, [:pasta_id]

  end
end
