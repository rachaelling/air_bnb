# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Seed Users
user = {}
user['password'] = 'qwe'

ActiveRecord::Base.transaction do
  50.times do
    user['email'] = Faker::Internet.email
    User.create(user)
  end
end

#Seed Listings
listing = {}
user_id = []
User.all.each { |u| user_id << u.id }

ActiveRecord::Base.transaction do
  50.times do
    listing['title'] = Faker::Address.street_name
    listing['location'] = Faker::Address.state
    listing['description'] = Faker::Hipster.sentence
    listing['available_from'] = Faker::Date.between(Date.today, 1.year.from_now)
    listing['available_to'] = Faker::Date.between(Date.today, 1.year.from_now)
    listing['capacity'] = rand(1..6)
    listing['user_id'] = user_id.sample
    Listing.create(listing)
  end
end
