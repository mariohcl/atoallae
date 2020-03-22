Rails.application.routes.draw do
  devise_for :controllers

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts

  root to:'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
