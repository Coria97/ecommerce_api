class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :stock_quantity, :weight, :dimensions, :active
end
