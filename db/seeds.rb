# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.delete_all
Closet.delete_all
User.delete_all

user1 = User.create!(username:'userfake1', email: 'user@fake.com', password:'password', password_confirmation:'password')
user2 = User.create!(username:'usertime', email: 'user@adventuretime.com', password:'adventure', password_confirmation:'adventure')

closet1 = Closet.create!(name: 'Winter14', user_id: user1.id)
closet2 = Closet.create!(name: 'Spring15', user_id: user2.id)
closet3 = Closet.create!(name: 'Joans wedding', user_id: user2.id)

article1 = Article.create!(name: 'Papaya shirt', category: 2, article_type: 1, favorite: false, closet_id: closet1.id)
article2 = Article.create!(name: 'Blue skirt', category: 1, article_type: 2, favorite: true,  closet_id: closet2.id)
article3 = Article.create!(name: 'Nude Mirror Leather Point Toe Pumps', category: 2, article_type: 0, favorite: true,  closet_id: closet3.id)
