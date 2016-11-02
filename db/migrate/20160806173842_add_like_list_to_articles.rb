class AddLikeListToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :like_list, :string, null: false, default: ""
  end
end
