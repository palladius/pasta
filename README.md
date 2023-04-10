# README

<img src='https://github.com/palladius/pasta/raw/master/doc/tagliatelle-red-green-yellow.png' width='50%' align='right' />

Welcome to my Pasta on Rails with self-dockerized app (still working only 95%).

This has a nice db/seed.rb teaching you all about Italian best practices, but if you're American or, worse, British,
knowck yourself out by adding onion and cream to yuour carbonara. Nobody will die - except a Neapolitan at every
`git commit` 🤪.

You can also find some goodies to deploy to GCP (eg Cloud Run).

# INSTALL

Self: 🗣️ [go/pasta-restore](http://go/pasta-restore)

This README would normally document whatever steps are necessary to get the
application up and running.

<img src='https://github.com/palladius/pasta/raw/master/doc/tagliatelle_on_rails.png' width='30%' align='left' />

* Rails `7.0.4`
* Ruby version: `3.1.2`
* System dependencies:
    * gem 'devise', for easy auth.
    * gem 'bootstrap', dont know why
    * ...

## New ideas

* (From Roberto) do the same with france and UK (maybe a namespace): fish and chips.

## Dockerization


Yay! I just fixed it. Try:

```docker run -it -p 8080:8080 palladius/pastang:v$(cat VERSION)```

or something similar

## skaffold.dev

Note to self: **Skaffold config is kubectl config-dependant**.

    $ kubectl config current-context # find your context which gives you PROJECT
    $ gcloud artifacts repositories list # gives you REPO and REGION
    $ skaffold config set default-repo REGION-docker.pkg.dev/PROJECT/REPO

Or just use this awesome:

    $ skaffold-autoconfigure-repo

My configs:

* at thome with my Mac M1: `europe-west3-docker.pkg.dev/cicd-platinum-test032/pasta-and-friends32`
* at work on my derek: (I believe on test31 prj) TODO(ricc)
* aspirina linux: ` gke_vulcanina_us-central1-c_dev` (gcloud container clusters get-credentials dev --zone us-central1-c --project vulcanina)

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


rails generate devise

# TODO USERS:
#    add_column :users, :likes,    :string, :default => 'chocolate, salmon, @meat'
#    add_column :users, :dislikes, :string, :default => '@vegetables, @tin_tuna'

# from https://github.com/heartcombo/devise/wiki/How-To:-Allow-users-to-sign-in-with-something-other-than-their-email-address
rails generate migration add_username_to_users username:string:uniq
```

## Running

<img src='https://github.com/palladius/pasta/raw/master/doc/pastang-matrix-screenshot.png' width='70%' align='right' />

* Cloud run: just created the `run` config:

```bash
skaffold dev -p run
skaffold build -p run
skaffold render -p run
skaffold run -p run
```

