# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


40.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email , password_digest: Digest::SHA3.hexdigest("password"))
end

burgers = ["Rise N' Shine",
          "Heavenly Double Cheese",
          "Navasota",
          "Smokey Goat",
          "Black Star Burger",
          "Juicy Lucy",
          "El Diablo",
          "Cheeseburger",
          "D.H. Special",
          "The Kevin Bacon",
          ]
description = ["Burger dressed with spicy mayo, lettuce, tomato, fried egg, ham and bacon.",
              " Featuring Local Organic Pasture Raised Hormone & Chemical-Free Grass Fed Beef Along with Locally-Grown Organic Produce when in Season. ",
              "Try the Navasota, which is a pork patty smothered in cheese, aioli, and chipotle sauces. It’s a mix of sweet and spicy that blends together nicely. ",
              "The Smokey Goat is a thick, juicy patty of ground beef (no goat?) covered with thick, crispy bacon, fried onions, and melted, full-flavored goat cheese (there it is!).",
              "They use locally sourced 44 Farms ground brisket to create a juicer, more flavorful burger that also gets a welcome tang from their house-made mustard.",
              " Juicy Lucy is a cheese-stuffed burger (native to Minnesota) topped with bacon, lettuce, tomatoes, and a creamy chipotle mayo.",
              "Angus Beef, Pepper Jack, Carmelized Onions, Habanero and Serrano Chiles, Salsa Roja, Chipotle Mayo",
              "100% all-natural black angus beef patty, American cheese",
              "Hamburger patty on toast with grilled onions, double cheese, tomato and pickle",
              "3 PIECES OF BACON & DANISH BLUE CHEESE"]
pic = ["http://s3-media4.fl.yelpcdn.com/bphoto/bwaSLrExmjA2phuTug6I6A/348s.jpg",
      "http://www.whollycowburgers.com/uploads/2/8/4/2/2842063/6777470_orig.jpg",
      "https://assets3.thrillist.com/v1/image/1208640/size/tl-horizontal_main/austin-s-10-best-under-the-radar-burgers",
      "https://assets3.thrillist.com/v1/image/1211046/size/tmg-article_default_mobile/austin-s-10-best-under-the-radar-burgers",
      "https://assets3.thrillist.com/v1/image/1208642/size/tmg-article_default_mobile/austin-s-10-best-under-the-radar-burgers",
      "https://assets3.thrillist.com/v1/image/1208645/size/tmg-article_default_mobile/austin-s-10-best-under-the-radar-burgers",
      "http://s3-media2.fl.yelpcdn.com/bphoto/gbevlxOXXDCP5av7zvIzmA/o.jpg",
      "http://s3-media1.fl.yelpcdn.com/bphoto/T3LAcw2YSvuAzzBMHTXcgQ/348s.jpg",
      "http://dirtymartins.com/wp-content/uploads/2012/06/DHSpecialwithFries.jpg",
      "http://twistedrootburgerco.com/wp-content/uploads/Burger_The_Kevin_Bacon.jpg",
      ]
location = ["Cow Bells",
            "Wholly Cow Burgers",
          "The Silo on 7th",
          "Red's Porch",
          "Black Star Co-Op",
          "Lard Have Mercy",
          "Hopdoddy",
          "P.Terry's",
          "Dirty Martins",
          "Twisted Root",
          ]

10.times do
  Post.create(title: burgers.pop,
              description: description.pop,
              pic: pic.pop,
              location: location.pop,
              user_id: User.all.sample.id)
end


200.times do
  Vote.create(post_id:Post.all.sample.id, user_id:User.all.sample.id)
end

10.times do
  Post.create(title: Faker::Hipster.sentence(1,false,3),
              description: Faker::Hipster.sentence(5,false,7),
              pic: Faker::Avatar.image,
              location: Faker::Company.name,
              user_id: User.all.sample.id)
end

100.times do
  Vote.create(post_id:Post.all.sample.id, user_id:User.all.sample.id)
end
