Rails.application.routes.draw do
  # devise_for :players
  get 'home/index'
  get '/players_list', to: 'players#list'
  root 'games#new'
  resources :games
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
