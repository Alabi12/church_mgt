Rails.application.routes.draw do
  resources :posts

  # Define resources for main models
  resources :services
  resources :generationals
  # resources :members do
  #   get :posts, on: :member
  # end

  resources :members do
    resources :posts, only: [:new, :create]
  end
  resources :groups
  resources :churches
  devise_for :users

  # Custom routes
  get '/cs_groups', to: 'generational_groups#cs_groups'
  get '/grouped_members', to: 'members#grouped_members', as: 'grouped_members'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root to: "churches#index"
end
