# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: `3.1.2`
* System dependencies


## copying from other app

```bash
rails g scaffold pastas name:string description:text active:boolean # boolean  :active, :default => true
# skipping users to use devise instead then add other stuff
rails g scaffold sauces name:string description:text active:boolean color:string #active, :default => true, color:default => 'rosso'

rails g scaffold pasta_sauces appropriate:boolean vote:integer notes:text pasta_id:integer sauce_id:integer
# Then change:
# :appropriate, :boolean, :default => true
# :vote, :integer, :default => 50
#  add_index :pasta_sauces, [:sauce_id]
#  add_index :pasta_sauces, [:pasta_id]

rails g scaffold events name:string

rails g scaffold ingredients name:string description:text tags:string

rails g scaffold ingredient_sauces necessary:boolean sauce_id:integer ingredient_id:integer notes:text
# Then change:
      #       t.boolean :necessary, :default => true


# TODO USERS:
#    add_column :users, :likes,    :string, :default => 'chocolate, salmon, @meat'
#    add_column :users, :dislikes, :string, :default => '@vegetables, @tin_tuna'

```
