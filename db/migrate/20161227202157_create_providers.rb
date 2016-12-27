class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :direction

      t.timestamps
    end
  end
end
