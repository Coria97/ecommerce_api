class AddJtiToConsumers < ActiveRecord::Migration[7.1]
  def change
    add_column :consumers, :jti, :string, null: false
    add_index :consumers, :jti
  end
end
  