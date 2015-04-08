class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :article_type, :category
end
