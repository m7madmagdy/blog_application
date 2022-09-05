Rails.application.routes.draw do
  root "users#index"

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
