class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :sauces do |t|
      t.string   :name
      t.text     :description
      t.boolean  :active
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :sauces
  end
end
