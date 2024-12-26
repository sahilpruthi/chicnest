Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'homes#index'
  resources :homes, only: :index do
    collection do
      post :create_contact
    end
  end
  get "/contact-us", to: "homes#contact_us"
  get "/about", to: "homes#about"
  get "/services", to: "homes#services"
end
