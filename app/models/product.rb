class Product < ApplicationRecord
    has_many :product_categories
    has_many :categories, through: :product_categories
    
    has_many :product_features
    has_many :features, through: :product_features

    has_many :product_images
    has_many :images, through: :product_images
end
