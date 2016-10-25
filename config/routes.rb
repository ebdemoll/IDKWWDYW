Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  match '/users/destroy', :to => "users#destroy", via: [:delete]

  resources :users

  root to: "home#show"

  match '/usergroups/search', :to => "usergroups#search", via: [:get, :post]

  resources :usergroups

  match '/recommendations/create', :to => "recommendations#create", via: [:get, :post]

  resources :recommendations

  match '/preferences/create', :to => "preferences#create", via: [:get, :post]

  match '/preferences/destroy', :to => "preferences#destroy", via: [:get, :post]

  resources :preferences

  resources :invites

  match '/memberships/destroy', :to => "memberships#destroy", via: [:delete]

  match '/memberships/create', :to => "memberships#create", via: [:get, :post]

  resources :memberships

end
