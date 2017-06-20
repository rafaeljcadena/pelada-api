Rails.application.routes.draw do

  resources :peladas
  # get ':id/:team_name', to: 'soccer_teams#show', as: :soccer_team

  
  resources :soccer_teams do
    member do
      get 'removing_user_from_team'
    end
  end
  devise_for :users, except: [:registration], :controllers => { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, path: '/admin/users'

  root to: "home#index"


  namespace :api, default: {format: :json} do
    post "join_team"
    post "unjoin_team"
    post "sign_in_user"
  end

  # post "api/join_team", to: "api#join_team"
  # post "api/unjoin_team", to: "api#unjoin_team"

end
