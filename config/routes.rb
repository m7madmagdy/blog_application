Rails.application.routes.draw do
  
  defaults format: :json do
    namespace :api do
      resources :users
      end
  end
  resources :users
  root "users#index"
end
