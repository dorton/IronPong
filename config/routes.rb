Rails.application.routes.draw do
  # devise_for :players
  get 'home/index'
  root 'home#index'
  resources :games
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
