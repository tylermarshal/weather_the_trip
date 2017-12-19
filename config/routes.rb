Rails.application.routes.draw do
  root :to => 'home#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :users, only: [:show, :new, :create] do
    resources :trips
  end

  resources :destinations do
    resources :recommendations
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
