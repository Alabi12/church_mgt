Rails.application.routes.draw do
  # Define resources for main models
  resources :payments
  resources :services
  resources :generationals
  resources :members
  resources :groups
  resources :churches
  devise_for :users

  # Define nested routes for members
  resources :members do
    get 'new_payment', on: :member
    get 'payment_transactions', on: :member
    resources :payments, only: [:new, :create]
  end
  
  # Custom routes
  get '/cs_groups', to: 'generational_groups#cs_groups'
  get '/grouped_members', to: 'members#grouped_members', as: 'grouped_members'
  
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root to: "churches#index"
end
