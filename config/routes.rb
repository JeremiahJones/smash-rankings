Rails.application.routes.draw do
  resources :miom_ranks
  resources :players

  root 'players#index'
end
