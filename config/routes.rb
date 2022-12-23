Rails.application.routes.draw do
  # https://stackoverflow.com/questions/46756109/change-default-routes-devise-rails
  devise_for :users

  get '/pasta_sauces/index_matrix', to: 'pasta_sauces#index_matrix'
  get '/pasta_sauces/index_boring', to: 'pasta_sauces#index_boring'

  resources :ingredient_sauces
  resources :ingredients
  resources :events
  resources :pasta_sauces
  resources :sauces
  resources :pastas # broken, eg No route matches {:action=>"show", :controller=>"pastas"}, missing required keys: [:id]


  root to: 'pasta_sauces#index_matrix' # /pasta_sauces/index_matrix
  get 'welcome/index'
  get 'welcome/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
end
