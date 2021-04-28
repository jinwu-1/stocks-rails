class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :symbol, :price
  has_one :user
end
