class ClosetSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :articles

  def created_at
    object.created_at.strftime('%Y-%m-%d')
  end
end
