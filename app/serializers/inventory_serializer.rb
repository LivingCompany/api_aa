class InventorySerializer < ActiveModel::Serializer
  attributes :id, :in_stock
  has_one :product
end
