Rails.application.routes.draw do

  resources :peladas
  resources :soccer_teams
  devise_for :users, except: [:registration], :controllers => { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players
  resources :users, path: '/admin/users'

  root to: "home#index"

  post "api/join_team", to: "api#join_team"
  post "api/unjoin_team", to: "api#unjoin_team"

end
