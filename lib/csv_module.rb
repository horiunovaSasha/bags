require 'csv'

module CsvModule
    CATEGORY_PATH = "./lib/categories.csv"
    PRODUCT_PATH = "./lib/products_full_info.csv"

    def load_categories
        table = CSV.parse(File.read(CATEGORY_PATH), headers: true)
        table.each do |item|
            Category.find_or_create_by(:id => item["Id"], :name => item["Name"], :parent_id => item["Parent"])
        end
    end

    def load_products
        table = CSV.parse(File.read(PRODUCT_PATH), headers: true)
        table.each do |item|
            product_id = Product.find_or_create_by(:id => item["Id"], 
                :title => item["Title"], 
                :description => item["Description"], 
                :price => item["price"], 
                :vendor_code => item["Vendor Code"],
                :availability => item["Availability"]).id
            load_product_images(product_id, item["Images"])
            load_product_cateories(product_id, item["Categories"])
            load_product_features(product_id, item["Attributes"])
        end
    end

    def load_product_images(current_product_id, images_string)
        images = images_string.split("|")
        images.each do |image|
           img_id = Image.find_or_create_by( :path => image).id
           ProductImage.find_or_create_by( :product_id => current_product_id, :image_id => img_id)
        end
    end

    def load_product_cateories(current_product_id, categories_string)
        categories = categories_string.split("|")
        categories.each do |category|
           ctg_id = Category.find_or_create_by( :name => category).id
           ProductCategory.find_or_create_by( :product_id => current_product_id, :category_id => ctg_id)
        end
    end

    def load_product_features(current_product_id, features_string)
        features = features_string.split("#")
        features.each do |feature|
           splited_record = feature.split("|")
           name = splited_record[0]
           value = splited_record[1]
           f_id = Feature.find_or_create_by( :title => name, :val => value).id
           ProductFeature.find_or_create_by( :product_id => current_product_id, :feature_id => f_id)
        end
    end
  end