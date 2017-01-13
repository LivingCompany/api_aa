class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.references :product, foreign_key: true
      t.decimal :in_stock
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
