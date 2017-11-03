Rails.application.routes.draw do
  devise_for :users

  resources :jobs do
    member do
      get :assign
    end
  end

  resources :boats do
    member do
      get :jobs
      post :job_add
      post :job_remove
    end
  end

  root 'users#index'
end
