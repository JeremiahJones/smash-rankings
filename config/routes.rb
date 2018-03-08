Rails.application.routes.draw do
  resources :miom_rankings
  resources :players

  root 'players#index'
end
