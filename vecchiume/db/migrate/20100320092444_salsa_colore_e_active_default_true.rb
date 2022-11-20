class SalsaColoreEActiveDefaultTrue < ActiveRecord::Migration
  def self.up
    add_column :sauces, :color, :string, :default => "rosso"
    change_column :sauces, :active, :boolean, :default => true
  end

  def self.down
    remove_column :sauces, :color
    change_column :sauces, :active, :boolean
  end
end
