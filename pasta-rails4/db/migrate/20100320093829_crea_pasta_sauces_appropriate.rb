class CreaPastaSaucesAppropriate < ActiveRecord::Migration
  def self.up
    create_table :pasta_sauces do |t|
      t.boolean  :appropriate
      t.integer  :vote
      t.text     :notes
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :pasta_sauces
  end
end
