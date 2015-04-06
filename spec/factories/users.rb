FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    username Faker::Internet.user_name
    password_digest "MyString"
    token SecureRandom.uuid.gsub(/\-/,'')
  end

end
