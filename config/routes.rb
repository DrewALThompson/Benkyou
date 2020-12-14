Rails.application.routes.draw do
  resources :translations
  resources :comments
  resources :words
  resources :projects
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
