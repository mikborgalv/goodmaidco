Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  get 'home/index'

  resources :feedbacks
  resources :service_records
  resources :partners
  resources :locations
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
