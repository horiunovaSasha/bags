class CreateValues < ActiveRecord::Migration[6.0]
  def change
    create_table :values do |t|
      #t.integer :id
      t.string :value

      t.timestamps
    end
  end
end
