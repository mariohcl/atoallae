Rails.application.routes.draw do

  resources :pages do
    resources :events
    member do
      put "follow" => "pages#follow"
    end
  end

  resources :profiles, only:[:show, :update, :edit]

  get '/my_profile' => 'profiles#profile', as: 'my_profile'
  # get 'comments/create'

  # get 'stock/index'

  resources :products do
    resources :stocks, only:[:index, :create]
  end
  devise_for :controllers

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # get 'user/:id' => 'user#profile', as: 'user_profile'

  # resources :user, only:[:show, :update, :edit]

  resources :profiles do
    member do
      put "follow" => "profiles#follow"
    end
  end

  resources :posts do
    resources :comments, only:[:create]
  end

  root to:'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
