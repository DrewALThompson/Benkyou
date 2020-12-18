Rails.application.routes.draw do
  root :to => 'projects#index'

  resources :users do
    resources :projects
    resources :words, except: [:show]
  end

  resources :projects
  resources :comments, except: [:index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
