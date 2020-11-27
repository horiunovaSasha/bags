Rails.application.routes.draw do
  root to: 'products#index'
  resources :products
  resources :product_images
  resources :images
  resources :product_features
  resources :features
  resources :categories
  resources :product_categories
  resources :values
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
