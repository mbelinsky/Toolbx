Thetoolbox::Application.routes.draw do

  get "privacy/index"

  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  get 'settings' => 'users#edit', as: 'edit_user'
  put 'settings' => 'users#update', as: 'edit_user'

  post 'tools/:id' => 'users#add_tool', as: 'add_tool'
  delete 'tools/:id' => 'users#remove_tool', as: 'remove_tool'

  post 'articles/:id' => 'users#add_article', as: 'add_article'
  delete 'articles/:id' => 'users#remove_article', as: 'remove_article'

  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'signup' => 'users#new', as: 'signup'

  get 'about' => 'about#index', as: 'about'
  get 'contact' => 'contact#index', as: 'contact'
  get 'privacy' => 'privacy#index', as: 'privacy'

  root to: 'home#index'

  resources :users, except: [:edit, :update, :destroy] do
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
    # resources :community do
    #   get 'page/:page', action: :index, on: :collection
    # end
    resources :articles do
      get 'page/:page', action: :index, on: :collection
    end

    resources :article_images, only: [:index, :create]
  end

  resources :sessions
  resources :password_resets
end