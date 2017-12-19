Rails.application.routes.draw do
  root :to => 'home#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :users, only: [:show, :new, :create] do
    resources :trips
  end

  scope :admin, module: :admin, as: :admin, only: [:new, :create, :edit, :update, :destroy] do
    resources :destinations
  end

  resources :destinations, only: [:index, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
