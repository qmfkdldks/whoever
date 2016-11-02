class AddIconToUser < ActiveRecord::Migration
  def change
    add_column :users, :icon_name, :string
  end
end
