Rails.application.routes.draw do
  root 'usergroups#index'
  resources :usergroups do
   resources :memberships, only: [:new] #-> domain.com/2/memberships/new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
end
