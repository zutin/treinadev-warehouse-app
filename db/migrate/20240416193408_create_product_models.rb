class CreateProductModels < ActiveRecord::Migration[7.1]
  def change
    create_table :product_models do |t|
      t.string :name
      t.string :sku
      t.integer :width
      t.integer :height
      t.integer :depth
      t.integer :weight
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
