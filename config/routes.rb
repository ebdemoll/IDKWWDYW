Rails.application.routes.draw do
  root 'usergroups#index'

  resources :usergroups

  resources :invites

  match '/memberships/create', :to => "memberships#create", via: [:get, :post]

  resources :memberships

  # devise_for :users, :controllers => {:registrations => "registrations"}

  devise_for :users, controllers: {registration: 'users/registration'}
end
