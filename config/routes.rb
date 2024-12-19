# config/routes.rb
Rails.application.routes.draw do
  root "home#index"

  # Маршруты для пользователей
  resources :users, only: [:index, :create, :new, :destroy] do
    member do
      get 'profile' # Доступ к профилю конкретного пользователя
    end
  end
  # Маршруты для сессий
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout

  # Маршруты для желаний
  resources :wishes

end




