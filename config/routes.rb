Thetoolbox::Application.routes.draw do
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"

  # User settings
  get 'settings' => 'users#edit', as: 'edit_user'
  put 'settings' => 'users#update', as: 'update_user'
  delete 'settings' => 'users#destroy', as: 'delete_user'

  # Adding tools
  # post 'users/:id/tools' => 'users#add_tool', as: 'add_tool'
  # delete 'users/:id/tools/:tool_id' => 'users#remove_tool', as: 'remove_tool'

  # Favoriting articles
  # post 'users/:id/articles' => 'users#add_article', as: 'add_article'
  # delete 'users/:id/articles/:article_id' => 'users#remove_article', as: 'remove_article'

  # Login/out/signup
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'signup' => 'users#new', as: 'signup'

  get 'about' => 'about#index', as: 'about'

  get 'contact' => 'contact#new', as: 'contact'
  post 'contact' => 'contact#create', as: 'contact'

  # Root URL
  root to: 'home#index'
  # Robots
  get 'robots.txt' => 'home#robots'

  # User
  get '/users/:id' => redirect('/users/%{id}/tools'), as: 'user'

  resources :users, except: [:index, :show, :edit, :update, :destroy] do
    get 'tools', action: :show_tools, on: :member
    get 'tools/page/:page', action: :show_tools, on: :member
    get 'articles', action: :show_articles, on: :member
    get 'articles/page/:page', action: :show_articles, on: :member
    get 'features', action: :show_features, on: :member
  end

  # Global search
  get 'search' => 'search#index', as: :search

  # City searching
  get 'cities' => 'cities#index', as: :cities

  # User's Toolbox
  namespace :toolbox do
    resources :tools, only: [:create, :destroy]
    resources :articles, only: [:create, :destroy]
  end

  # Tools
  resources :tools, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection

    get 'suggestions', action: :new_suggestion, on: :collection
    post 'suggestions', action: :create_suggestion, on: :collection
  end

  # Articles
  resources :articles, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection
  end

  # Apptivists

  resources :apptivists, controller: 'users' do
    get '/' => 'users#index'

    get 'page/:page', action: :index, on: :collection
  end

  # Tools Roundup
  resources :roundups, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection
  end

  # Admin
  get '/admin' => redirect('/admin/tools')
  namespace :admin do
    get 'search-tags', action: :search_tags

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

    resources :users do
      get 'page/:page', action: :index, on: :collection
    end

    resources :roundups do
      get 'page/:page', action: :index, on: :collection
    end
  end

  post 'users/:id/toggle_apptivist' => 'admin/users#toggle_apptivist', as: 'apptivist'

  # Login/out
  resources :sessions
  get 'auth/:provider/callback', to: 'sessions#create_omniauth'
  get 'auth/failure', to: 'sessions#failure'

  # Password resets
  resources :password_resets

  # Errors
  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end
end
