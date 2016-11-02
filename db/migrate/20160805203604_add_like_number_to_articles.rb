class AddLikeNumberToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :like_number, :integer, null: false, default: 0
  end
end
