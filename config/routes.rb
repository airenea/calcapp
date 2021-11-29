Rails.application.routes.draw do
  resources :solve_computations
  resources :zeroes_computations
  resources :log_computations
  resources :tangent_computations
  resources :def_integral_computations
  resources :trig_computations
  resources :computations
  root to: 'computations#index'
end
