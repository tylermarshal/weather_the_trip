Rails.application.routes.draw do
  root :to => 'home#index'

  resources :users, only: [:show, :new, :create]

  resources :trips
  resources :destinations do
    resources :recommendations
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
