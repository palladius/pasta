# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: `3.1.2`
* System dependencies


## copying from other app

```bash
rails g scaffold pastas name:string description:text active:boolean # t.boolean  :active, :default => true
# skipping users to use devise instead then add other stuff
rails g scaffold sauces name:string description:text active:boolean # probably also here: , :default => true

```
