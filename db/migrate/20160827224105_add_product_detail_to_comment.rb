class AddProductDetailToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :product_detail, index: true, foreign_key: true
  end
end
