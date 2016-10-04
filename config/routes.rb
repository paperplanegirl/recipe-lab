Rails.application.routes.draw do

  resources :recipes
  resources :courses
  resources :ingredients

  root 'main#index'
end
