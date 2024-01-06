class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :stock_quantity
      t.string :sku, null: false, index: { unique: true }
      t.float :weight
      t.string :dimensions
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
