class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :type, :category
end
