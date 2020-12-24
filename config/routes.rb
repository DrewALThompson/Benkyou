Rails.application.routes.draw do
  root :to => 'projects#index'
  resources :users do
    resources :projects
    resources :words, except: [:new]
  end
  
  resources :words
  resources :projects
  resources :comments, only: [:new, :create, :edit, :update, :destroy]
  match '/auth/facebook/callback', to: 'sessions#create', via: [:get, :post]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/admin' => 'admin#index'
  namespace :admin do
    resources :stats, only: [:index]
    resources :users, only: [:edit, :update]
  end
  get "*any", via: :all, to: "errors#not_found"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
