Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "products#index"

  resources :cart_products, only: %i[create update destroy]
  resources :carts, only: :index
  resources :check_out, only: :index
  resources :products, only: %i[index show]
  resources :orders, only: %i[index show create update]

end
