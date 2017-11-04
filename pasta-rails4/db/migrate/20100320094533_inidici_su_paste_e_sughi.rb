class InidiciSuPasteESughi < ActiveRecord::Migration
  def self.up
    change_column :pasta_sauces, :vote, :integer, :default => 50

    add_index :pasta_sauces, [:sauce_id]
    add_index :pasta_sauces, [:pasta_id]
  end

  def self.down
    change_column :pasta_sauces, :vote, :integer

    remove_index :pasta_sauces, :name => :index_pasta_sauces_on_sauce_id rescue ActiveRecord::StatementInvalid
    remove_index :pasta_sauces, :name => :index_pasta_sauces_on_pasta_id rescue ActiveRecord::StatementInvalid
  end
end
