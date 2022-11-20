class AddsAdminColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    # https://stackoverflow.com/questions/40794650/devise-add-admin-role
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
