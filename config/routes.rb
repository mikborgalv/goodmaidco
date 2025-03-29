Rails.application.routes.draw do
  get 'dashboard/index'
  ActiveAdmin.routes(self)
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  get 'home/index'
 # updated this
  resources :service_records do
    resources :feedbacks, only: [:new, :create, :show]
  end

  resources :feedbacks
  # resources :service_records
  resources :partners
  resources :locations
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
authenticated :user do
  root to: 'dashboard#index', as: :authenticated_root
end
  # Defines the root path route ("/")
  root "home#index"
end
