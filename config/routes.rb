Rails.application.routes.draw do

  # get 'comments/create'

  # get 'stock/index'

  resources :products do
    resources :stocks, only:[:index, :create]
  end
  devise_for :controllers

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts do
    resources :comments, only:[:create]
  end

  root to:'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
