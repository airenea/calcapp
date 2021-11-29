Rails.application.routes.draw do
  resources :computations
  root to: 'computations#index'
end
