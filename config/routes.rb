Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :new, :destroy]
      resources :churches, only: [:index, :show, :create, :update, :new, :destroy]
      resources :members, only: [:index, :show, :create, :update, :new, :destroy]
      resources :teams, only: [:index, :show, :create, :update, :new, :destroy]
      resources :programs, only: [:index, :show, :create, :update, :new, :destroy]
      resources :attendances, only: [:index, :show, :create, :update, :new, :destroy]
    end
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  get '/current_user', to: 'current_user#index'
  # devise_for :users, controllers: {
  #   sessions: 'api/v1/sessions',
  #   registrations: 'api/v1/registrations'
  # }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
