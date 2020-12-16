Rails.application.routes.draw do
  root :to => 'projects#index'

  resources :users do
    resources :projects
    resources :translations
    resources :words, except: [:show]
  end

  resources :projects
  resources :translations, except: [:index, :show]
  resources :comments, except: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
