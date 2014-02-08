Blocmarks::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  # get "tags/index"
  # get 'tags/:tag', to: 'bookmarks#index', as: :tag
  # get 'tags', to: 'tags#index', as: :tag
  # get 'tags/:id', to: 'tags#show', as: :tag
  resources :tags, only: [:index, :show]
  resources :bookmarks, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  root 'bookmarks#index'

 
end
