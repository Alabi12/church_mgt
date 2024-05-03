Rails.application.routes.draw do
  resources :services
  resources :generationals
  resources :members
  resources :groups
  resources :churches
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/cs_groups', to: 'generational_groups#cs_groups'

  get '/grouped_members', to: 'members#grouped_members', as: 'grouped_members'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "churches#index"
end
