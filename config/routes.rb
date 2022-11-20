Rails.application.routes.draw do
  #devise_for :users
  # https://stackoverflow.com/questions/46756109/change-default-routes-devise-rails
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    #sign_up: 'cmon_let_me_in'
    sign_up: 'signup'
  }

  resources :ingredient_sauces
  resources :ingredients
  resources :events
  resources :pasta_sauces
  resources :sauces
  resources :pastas # broken
  root to: 'pasta_sauces#index'
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
