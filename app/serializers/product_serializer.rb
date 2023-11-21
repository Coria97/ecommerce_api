# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  active         :boolean          default(TRUE)
#  description    :text
#  dimensions     :string
#  name           :string
#  price          :decimal(10, 2)
#  sku            :string           not null
#  stock_quantity :integer
#  weight         :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_products_on_sku  (sku) UNIQUE
#
class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :stock_quantity, :weight, :dimensions, :active
end
