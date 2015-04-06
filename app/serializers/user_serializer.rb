class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :token
  has_many :closets
end
