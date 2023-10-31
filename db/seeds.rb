# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_1 = User.create!(username: "Bif", email: "bif@example.com", password: "password")

church_1 = user_1.churches.create!(
  name: Faker::Book.title,
  established_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25'),
  location: Faker::Address.city
)

member_1 = user_1.members.create!(
  name: Faker::Name.name,
  photo: "https://robohash.org/sitsequiquia.png?size=300x300&set=set1",
  joined_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25'),
  address: Faker::Address.city,
  phone_number: Faker::PhoneNumber.cell_phone,
  church_id: church.id
)

team_1 = user_1.teams.create!(
  name: Faker::Sports::Football.team,
  main_leader_name: Faker::Name.name,
  sub_leader_name: Faker::Name.name,
  member_id: member_1.id,
  church_id: church.id
)

program_1 = user_1.programs.create!(
  name: Faker::ProgrammingLanguage.name,
  date: Faker::Date.between(from: '2008-09-23', to: '2023-09-25'),
  attendance_id: attendance_1.id,
  church: church_1,
  team_id: team_1.id
)

attendance_1 = user_1.attendances.create!(
  name: Faker::Name.name,
  att_taker: Faker::Name.name,
  is_present: true
)



