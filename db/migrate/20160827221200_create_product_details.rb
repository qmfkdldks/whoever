class CreateProductDetails < ActiveRecord::Migration
  def change
    create_table :product_details do |t|
      t.references :product, index: true, foreign_key: true
      t.text :images
      t.text :description

      t.timestamps null: false
    end
  end
end
