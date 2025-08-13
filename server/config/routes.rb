Rails.application.routes.draw do
  resources :feature_flags
  namespace :api do
    namespace :v1 do
      resources :feature_flags
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
