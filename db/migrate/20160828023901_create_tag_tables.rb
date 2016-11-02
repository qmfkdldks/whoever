class CreateTagTables < ActiveRecord::Migration
  def change
    create_table :tag_tables do |t|
      t.references :tag, index: true
      t.references :product, index: true

      t.timestamps null: false
    end
  end
end
