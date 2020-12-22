Rails.application.routes.draw do
  root :to => 'projects#index'
  resources :users do
    resources :projects
    resources :words, except: [:show]
  end

  resources :projects
  resources :comments, except: [:index, :show]
  resources :words
  match '/auth/facebook/callback', to: 'sessions#facebook', via: [:get, :post]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/admin' => 'admin#index'
  namespace :admin do
    resources :stats, only: [:index]
    resources :users, only: [:edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
