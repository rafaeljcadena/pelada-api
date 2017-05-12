Rails.application.routes.draw do

  resources :peladas
  resources :soccer_teams
  devise_for :users, except: [:registration]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players


  root to: "home#index"

end
