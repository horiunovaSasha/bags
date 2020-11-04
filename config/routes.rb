Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :product_categories
  resources :product_attributes
  resources :values
  resources :attributes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
