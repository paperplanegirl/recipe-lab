Rails.application.routes.draw do
  root 'main#index'

  # AUTHENTICATION
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  # Users - custom routes for users, registration, profile, editing etc
  get "signup" => "users#new"
  post "signup" => "users#create"
  





  resources :users
  resources :recipes
  resources :courses
  resources :ingredients

end
