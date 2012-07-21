# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  Product.delete_all
# . . .
  Product.create(:title => 'Programming for IPhone',  :description =>
  %{<p> Bla-bla-bla...It's a cool book for you.  </p>}, :image_url => '/images/iphone.jpg', :price => 29.50)
Product.create(:title => 'Programming with Python',  :description =>
  %{<p> Bla-bla-bla...It's a great book for you.  </p>}, :image_url => '/images/python.jpg', :price => 21.50)

Product.create(:title => 'Programming with C++',  :description =>
  %{<p> Bla-bla-bla...It's book for you.  </p>}, :image_url => '/images/cplus.jpg', :price => 25.50)
