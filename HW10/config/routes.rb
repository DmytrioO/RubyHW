Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :products, only: %i[ index show ]
  resources :carts, only: :index
  resources :cart_products, only: %i[ create update destroy ]
  resources :orders, only: %i[ index show create update ]
  resources :check_out, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end
