Rails.application.routes.draw do
  resources :ingredient_sauces
  resources :ingredients
  resources :events
  resources :pasta_sauces
  resources :sauces
  resources :pastas # broken
  root to: 'sauces#index'
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
