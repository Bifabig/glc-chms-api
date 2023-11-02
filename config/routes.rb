Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :new, :destroy]
      resources :churches, only: [:index, :show, :create, :new, :destroy]
      resources :members, only: [:index, :show, :create, :new, :destroy]
      resources :teams, only: [:index, :show, :create, :new, :destroy]
      resources :programs, only: [:index, :show, :create, :new, :destroy]
      resources :attendances, only: [:index, :show, :create, :new, :destroy]
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
