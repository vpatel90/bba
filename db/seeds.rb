# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


20.times do
  Post.create(title: Faker::Hipster.sentence(1,false,3),
              description: Faker::Hipster.sentence(5,false,7),
              pic: Faker::Company.logo)
end

200.times do
  Vote.create(post_id:Post.all.sample.id)
end
