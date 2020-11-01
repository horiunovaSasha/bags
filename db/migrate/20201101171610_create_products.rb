class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      #t.integer :id
      t.string :title
      t.string :description
      t.float :price
      t.boolean :availability
      t.string :vendor_code

      t.timestamps
    end
  end
end
