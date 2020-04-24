Rails.application.routes.draw do

  get 'home/index'

  resources :pages do
    resources :events do
      member do
        put "like" => "events#like"
      end
    end
    member do
      put "follow" => "pages#follow"
    end
  end

  resources :profiles, only:[:show, :update, :edit]

  get '/my_profile' => 'profiles#profile', as: 'my_profile'
  get '/my_pages' => 'pages#my_pages', as: 'my_pages'
  # get 'comments/create'

  # get 'stock/index'

  resources :products do
    resources :stocks, only:[:index, :create]
  end
  devise_for :controllers

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
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

    member do
      put "like" => "posts#like"
    end
  end

  root to:'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
