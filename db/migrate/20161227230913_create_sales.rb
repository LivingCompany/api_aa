class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.decimal :price
      t.string :description
      t.references :product, foreign_key: true
      t.decimal :quantity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
