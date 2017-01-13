class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :purchase_price, :sale_price, :description
  has_one :user
  has_one :provier
end
