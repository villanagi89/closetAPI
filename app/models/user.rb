class User < ActiveRecord::Base
   has_many :closets, dependent: :destroy
   has_many :articles, through: :closets
   has_secure_password

   before_create :generate_token

   def generate_token
    return if token.present?
    begin
      self.token = SecureRandom.uuid.gsub(/\-/,'')
    end while self.class.exists?(token: token)
  end


end
