Blocmarks::Application.routes.draw do
  get 'tags/:tag', to: 'bookmarks#index', as: :tag
  resources :tags, only: [:index, :show]
  resources :bookmarks, only: [:index, :show, :new, :edit, :create, :update]

  root 'bookmarks#index'

 
end
