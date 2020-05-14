Rails.application.routes.draw do

  resources :orders, only:[:create, :index, :destroy]

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

  resources :profiles, only:[:index, :show, :update, :edit]

  get '/my_profile' => 'profiles#profile', as: 'my_profile'
  get '/my_pages' => 'pages#my_pages', as: 'my_pages'
  get '/my_events' => 'events#my_events', as: 'my_events'
  get '/searching' => 'user#searching', as: 'searching'

  resources :products do
    resources :stocks, only:[:index, :create]
  end
  devise_for :controllers

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get '/resultados_busqueda/:search' => 'user#search', as: 'resultados_busqueda'

  put 'follow/:id/:id2' => 'profiles#follow', as: 'follow_profile'

  resources :posts do
    resources :comments, only:[:create]

    member do
      put "like" => "posts#like"
    end
  end

  root to:'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
