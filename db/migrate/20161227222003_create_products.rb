class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :purchase_price
      t.decimal :sale_price
      t.text :description
      t.references :user, foreign_key: true
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
