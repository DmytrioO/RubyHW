Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments
      end
      resources :authors
      #resources :tags
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
