class AddLikesDislikesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :likes,    :string, :default => 'chocolate, salmon, @meat'
    add_column :users, :dislikes, :string, :default => '@vegetables, @tin_tuna'
  end

  def self.down
    remove_column :users, :dislikes
    remove_column :users, :likes
  end
end
