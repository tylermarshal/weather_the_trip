Rails.application.routes.draw do
  root :to => 'home#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post '/destinations', to: "admin/destinations#create"
  delete '/destinations/:id', to: "admin/destinations#destroy"
  put '/destinations/:id', to: "admin/destinations#update"

  resources :users, only: [:show, :new, :create] do
    resources :trips
  end

  namespace :admin, only: [:new, :edit] do
    resources :destinations
  end

  resources :destinations, only: [:index, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
