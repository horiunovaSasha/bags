class CreateProductFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :product_features do |t|
      t.integer :product_id
      t.integer :feature_id

      t.timestamps
    end
  end
end
