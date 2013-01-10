Thetoolbox::Application.routes.draw do

  get "privacy/index"

  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'signup' => 'users#new', as: 'signup'

  root to: 'home#index'

  resources :users do
    get 'page/:page', action: :index, on: :collection
  end
  resources :tools do
    get 'page/:page', action: :index, on: :collection
  end
  resources :articles, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection
  end
  resources :contact, only: [:index]
  resources :privacy, only: [:index]

  resources :sessions
  resources :password_resets
end