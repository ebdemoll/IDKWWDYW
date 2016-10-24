Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  resources :users

  match '/privacy_policy', :to => 'pages#privacy_policy', via: [:get]

  root to: "home#show"

  match '/usergroups/search', :to => "usergroups#search", via: [:get, :post]

  resources :usergroups

  match '/preferences/create', :to => "preferences#create", via: [:get, :post]

  resources :preferences

  resources :invites

  match '/memberships/create', :to => "memberships#create", via: [:get, :post]

  resources :memberships

end
