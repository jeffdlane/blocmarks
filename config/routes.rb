Blocmarks::Application.routes.draw do
  # get "tags/index"
  # get 'tags/:tag', to: 'bookmarks#index', as: :tag
  # get 'tags', to: 'tags#index', as: :tag
  # get 'tags/:id', to: 'tags#show', as: :tag
  resources :tags, only: [:index, :show]
  resources :bookmarks, only: [:index, :show, :new, :edit, :create, :update]

  root 'bookmarks#index'

 
end
