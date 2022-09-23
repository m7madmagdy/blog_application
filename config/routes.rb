Rails.application.routes.draw do

  #Sidekiq Web UI, only for admins.
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root "users#index"
  get 'users/random_user'
  get 'users/destroy_all'


  defaults format: :json do
    namespace :api do
      resources :users do
        resources :comments
      end
    end
  end

  resources :users do
    resources :comments
  end

end
