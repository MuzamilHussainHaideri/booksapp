class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :description
end
