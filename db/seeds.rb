# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all


20.times do
  u = User.create!(
    first_name: Faker::Mountain.name,
    last_name: Faker::Mountain.range
  )
  u.errors.messages
end

20.times do 
  d_date = Faker::Date.forward(days: 23)
  e = Event.create!(
    start_date: d_date.to_datetime,
    duration: 50,
    title: Faker::FunnyName.name,
    description: Faker::Marketing.buzzwords,
    price: rand(1..500),
    location: Faker::University.name,
    creator: User.all.sample
  )
  e.errors.messages
end

20.times do 
  a = Attendance.create!(
    stripe_customer_id: 30,
    user: User.all.sample,
    event: Event.all.sample
  )
  a.errors.messages
end


puts "%" * 50
puts "           Base de données remplie !"
puts "%" * 50