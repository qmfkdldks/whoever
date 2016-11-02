class AddCategoryToTag < ActiveRecord::Migration
  def change
    add_reference :tags, :category, index: true, foreign_key: true
  end
end
