class ProviderSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :direction
  belongs_to :user
  link(:self) { provider_url(object) }
end
