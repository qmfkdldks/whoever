class AddViewNumberToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :view_number, :integer, null: false, default: 0
  end
end
