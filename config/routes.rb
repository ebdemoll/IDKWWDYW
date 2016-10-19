Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

  resources :usergroups

  match '/invites/create', :to => "invites#create", via: [:get, :post]

  resources :invites


  match '/memberships/create', :to => "memberships#create", via: [:get, :post]

  resources :memberships


end
