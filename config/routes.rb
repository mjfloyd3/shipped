Rails.application.routes.draw do
  devise_for :users
  resources :boats
  resources :jobs

  root 'users#index'
end
