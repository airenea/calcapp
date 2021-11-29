Rails.application.routes.draw do
  resources :trig_computations
  resources :computations
  root to: 'computations#index'
end
