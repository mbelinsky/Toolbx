Thetoolbox::Application.routes.draw do

  get "privacy/index"

  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'signup' => 'users#new', as: 'signup'

  get 'about' => 'about#index', as: 'about'
  get 'contact' => 'contact#index', as: 'contact'
  get 'privacy' => 'privacy#index', as: 'privacy'

  root to: 'home#index'

  resources :users do
    get 'page/:page', action: :index, on: :collection
  end

  resources :tools, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection

    get 'suggestions', action: :new_suggestion, on: :collection
    post 'suggestions', action: :create_suggestion, on: :collection
  end

  resources :articles, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection
  end

  match '/admin' => redirect('/admin/tools')
  namespace :admin do
    resources :tools do
      get 'page/:page', action: :index, on: :collection
    end
    resources :community do
      get 'page/:page', action: :index, on: :collection
    end
    resources :articles do
      get 'page/:page', action: :index, on: :collection
    end
  end

  resources :sessions
  resources :password_resets
end