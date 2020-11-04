class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.boolean :availability
      t.string :vendor_code
      t.string :external_id

      t.timestamps
    end
  end
end
