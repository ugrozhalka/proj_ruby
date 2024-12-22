# config/routes.rb
Rails.application.routes.draw do
  root "home#index"

  # Маршруты для пользователей
  resources :users, only: [:index, :create, :index, :destroy] do
    member do
      get 'profile' # Доступ к профилю конкретного пользователя
    end
  end

  # Маршруты для сессий
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout
  delete 'logout', to: 'sessions#destroy'

  get 'home/index', to: 'home#index'
  get 'users/index', to: 'users#index'
  post 'users/index', to: 'users#create'
  delete 'users/index', to: 'users#destroy'


  # Маршруты для желаний
  #resources :wishes
  get '/wishes/new', to: 'wishes#new', as: :wishes
  get '/wishes/:id', to: 'wishes#show', as: :showWish
  post '/wishes/new', to: 'wishes#create', as: :wishes_new
  get '/wishes/:id/edit', to: 'wishes#edit', as: :editWish
  put '/wishes/:id', to: 'wishes#update', as: :wish
  get '/wishes/:id', to: 'wishes#destroy', as: :delWish
  patch '/wishes/:id', to: 'wishes#update', as: :wish_update
  delete '/wishes/:id', to: 'wishes#destroy'
end










