# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


# db/seeds.rb
puts "Cleaning database..."
Account.destroy_all
Partner.destroy_all
Location.destroy_all
ServiceRecord.destroy_all
Feedback.destroy_all
AdminUser.destroy_all
User.destroy_all

puts "Creating admin user..."
admin = AdminUser.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password"
)

puts "Creating regular users..."
user1 = User.create!(
  email: "user1@example.com",
  password: "password",
  password_confirmation: "password",
  role: "user"
)

user2 = User.create!(
  email: "user2@example.com",
  password: "password",
  password_confirmation: "password",
  role: "user"
)

puts "Creating accounts..."
account1 = Account.create!(
  name: "Premium Cleaning Co",
  phone_number: "555-123-4567",
  billing_address: "123 Main St, Anytown, USA",
  user: user1
)

account2 = Account.create!(
  name: "Office Maintenance LLC",
  phone_number: "555-987-6543",
  billing_address: "456 Business Ave, Somewhere, USA",
  user: user2
)

puts "Creating locations..."
locations = []
3.times do |i|
  locations << Location.create!(
    name: ["Downtown", "Uptown", "Midtown", "Westside", "Eastside"][i],
    address: "#{100 + i} Location St",
    city: ["Anytown", "Somewhere", "Otherplace"][i % 3],
    postal_code: "1234#{i}",
    cleaning_frequency: ["Daily", "Weekly", "Bi-weekly", "Monthly"][i % 4],
    account: account1
  )
end

2.times do |i|
  locations << Location.create!(
    name: ["Corporate HQ", "Branch Office"][i],
    address: "#{200 + i} Office Park",
    city: "Somewhere",
    postal_code: "5678#{i}",
    cleaning_frequency: "Weekly",
    account: account2
  )
end

puts "Creating partners..."
partners = []
5.times do |i|
  partners << Partner.create!(
    name: ["CleanPro", "SparkleTeam", "MaidRight", "DustBusters", "PureClean"][i],
    phone_number: "555-111-222#{i}",
    rating: rand(3.0..5.0).round(1),
    role: ["client", "provider"][i % 2],
    user: [admin, nil][i % 2] # Some owned by admin, some not
  )
end

puts "Creating service records..."
services = []
10.times do |i|
  location = locations.sample
  services << ServiceRecord.create!(
    partner: partners.select { |p| p.role == "provider" }.sample,
    location: location,
    date: rand(1..30).days.ago,
    status: ["pending", "in_progress", "completed"].sample
  )
end

puts "Creating feedbacks..."
services.select { |s| s.status == "completed" }.each do |service|
  Feedback.create!(
    service_record: service,
    user: service.location.account.user,
    content: ["Great job!", "Could be better", "Excellent service", "Will hire again"].sample,
    rating: rand(1..5)
  )
end

puts "Creating sample admin partner..."
Partner.create!(
  name: "Admin Partner",
  phone_number: "555-999-8888",
  rating: 5.0,
  role: "provider",
  user: admin
)

puts "Finished seeding! Created:"
puts "- #{User.count} users"
puts "- #{Account.count} accounts"
puts "- #{Location.count} locations"
puts "- #{Partner.count} partners"
puts "- #{ServiceRecord.count} service records"
puts "- #{Feedback.count} feedbacks"
puts "- #{AdminUser.count} admin users"

puts "Admin login: admin@example.com / password"
puts "User1 login: user1@example.com / password"
puts "User2 login: user2@example.com / password"