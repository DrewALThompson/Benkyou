Rails.application.routes.draw do
  root :to => 'projects#index'
  resources :users do
    resources :projects
    resources :words, except: [:new, :show]
  end
  
  resources :words, except: [:show]
  resources :projects
  resources :comments, only: [:new, :create, :edit, :update, :destroy]
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/admin' => 'admin#index'
  get '/admin/stats' => 'admin#stats'
  namespace :admin do
    resources :users, only: [:index]
  end
  get "*any", via: :all, to: "errors#not_found"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
