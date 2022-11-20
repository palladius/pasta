class LinkAPastaESauce < ActiveRecord::Migration
  def self.up
    add_column :pasta_sauces, :pasta_id, :integer
    add_column :pasta_sauces, :sauce_id, :integer
    change_column :pasta_sauces, :appropriate, :boolean, :default => true
  end

  def self.down
    remove_column :pasta_sauces, :pasta_id
    remove_column :pasta_sauces, :sauce_id
    change_column :pasta_sauces, :appropriate, :boolean
  end
end
