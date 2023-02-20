require 'sidekiq/web'

Rails.application.routes.draw do
  root "products#index"

  ActiveAdmin.routes(self)


  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :cart_products, only: %i[create update destroy]
  resources :carts, only: :index
  resources :check_out, only: :index
  resources :orders, only: %i[index show create update]
  resources :products, only: %i[index show]
  resources :quotes

end
