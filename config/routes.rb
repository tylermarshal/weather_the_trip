Rails.application.routes.draw do
  root :to => 'home#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:show, :new, :create] do
    resources :trips
  end

  namespace :admin, only: [:new, :create, :edit, :update, :destroy] do
    resources :destinations
  end

  resources :destinations, only: [:index, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
