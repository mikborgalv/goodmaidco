Rails.application.routes.draw do
  resources :feedbacks
  resources :service_records
  resources :partners
  resources :locations
  resources :accounts
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
