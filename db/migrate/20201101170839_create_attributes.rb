class CreateAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :attributes do |t|
      #t.integer :id
      t.string :title

      t.timestamps
    end
  end
end
