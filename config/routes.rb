# config/routes.rb
Rails.application.routes.draw do
  root "home#index"
  get 'home/index', to: 'home#index'

  # Маршруты для пользователей
  get 'users/index', to: 'users#index'
  post 'users/index', to: 'users#create'
  get 'users/:id', to: 'users#destroy', as: :deleteUser

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


  # Маршруты для желаний
  get '/wishes/new', to: 'wishes#new', as: :wishes
  post '/wishes/new', to: 'wishes#create', as: :wishes_new
  get '/wishes/:id', to: 'wishes#show', as: :showWish
  get '/wishes/:id/edit', to: 'wishes#edit', as: :editWish
  put '/wishes/:id', to: 'wishes#update', as: :wish
  get '/wishes/:id', to: 'wishes#destroy', as: :deleteWish
  patch '/wishes/:id', to: 'wishes#update', as: :wish_update
  delete '/wishes/:id', to: 'wishes#destroy'

  resources :wishes do
    member do
      post 'fulfill'  # добавляем маршрут для выполнения желания
    end
  end
end










