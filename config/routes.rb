Rails.application.routes.draw do
  resources :product_categories
  resources :product_attributes
  resources :products
  resources :values
  resources :attributes
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
