Thetoolbox::Application.routes.draw do

  get "privacy/index"

  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  # User settings
  get 'settings' => 'users#edit', as: 'edit_user'
  put 'settings' => 'users#update', as: 'edit_user'

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
  get 'contact' => 'contact#index', as: 'contact'
  get 'privacy' => 'privacy#index', as: 'privacy'

  # get '/users/:id/tools' => 'users#show_tools', as: 'user_tools'
  # get '/users/:id/articles' => 'users#show_articles', as: 'user_articles'
  # get '/users/:id/tools/page/:page' => 'users#show_tools', as: 'user_tools'
  # get '/users/:id/articles/page/:page' => 'users#show_articles', as: 'user_articles'

  root to: 'home#index'

  # User pages
  get '/users/:id' => redirect('/users/%{id}/tools'), as: 'user'

  resources :users, except: [:show, :edit, :update, :destroy]

  namespace :toolbox do
    resources :tools, only: [:create, :destroy]
    resources :articles, only: [:create, :destroy]
  end

  resources :tools, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection

    get 'suggestions', action: :new_suggestion, on: :collection
    post 'suggestions', action: :create_suggestion, on: :collection
  end

  resources :articles, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection
  end

  get '/admin' => redirect('/admin/tools')
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