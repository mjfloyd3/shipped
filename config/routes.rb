Rails.application.routes.draw do
  devise_for :users

  resources :boats do
    member do
      get :jobs
      post :job_add
    end
  end


  resources :jobs do
    member do
      get :assign
    end
  end

  root 'users#index'
end
