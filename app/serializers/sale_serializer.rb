class SaleSerializer < ActiveModel::Serializer
  attributes :id, :price, :description, :quantity
  has_one :product
  has_one :user
end
