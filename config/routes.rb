Blocmarks::Application.routes.draw do
  get 'tags/:tag', to: 'bookmarks#index', as: :tag
  resources :bookmarks, only: [:index, :show, :new, :edit, :create]
  resources :incoming_mails, only: [:create]

  root 'bookmarks#index'

 
end
