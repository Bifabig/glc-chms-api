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
church_2 = user_1.churches.create!(
  name: Faker::Book.title,
  established_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25'),
  location: Faker::Address.city
)

# member_1 = church_1.members.create!(
#   name: Faker::Name.name,
#   photo: "https://robohash.org/sitsequiquia.png?size=300x300&set=set1",
#   joined_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25'),
#   address: Faker::Address.city,
#   phone_number: Faker::PhoneNumber.cell_phone
# )
# member_2 = church_1.members.create!(
#   name: Faker::Name.name,
#   photo: "https://robohash.org/sitsequiquia.png?size=300x300&set=set1",
#   joined_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25'),
#   address: Faker::Address.city,
#   phone_number: Faker::PhoneNumber.cell_phone
# )
# member_3 = church_2.members.create!(
#   name: Faker::Name.name,
#   photo: "https://robohash.org/sitsequiquia.png?size=300x300&set=set1",
#   joined_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25'),
#   address: Faker::Address.city,
#   phone_number: Faker::PhoneNumber.cell_phone
# )
# member_4 = church_2.members.create!(
#   name: Faker::Name.name,
#   photo: "https://robohash.org/sitsequiquia.png?size=300x300&set=set1",
#   joined_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25'),
#   address: Faker::Address.city,
#   phone_number: Faker::PhoneNumber.cell_phone
# )

team_1 = church_1.teams.create!(
  name: Faker::Sports::Football.team,
  main_leader_name: Faker::Name.name,
  sub_leader_name: Faker::Name.name,
  established_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25')
)
team_2 = church_1.teams.create!(
  name: Faker::Sports::Football.team,
  main_leader_name: Faker::Name.name,
  sub_leader_name: Faker::Name.name,
  established_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25')
)
team_3 = church_2.teams.create!(
  name: Faker::Sports::Football.team,
  main_leader_name: Faker::Name.name,
  sub_leader_name: Faker::Name.name,
  established_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25')
)
team_4 = church_2.teams.create!(
  name: Faker::Sports::Football.team,
  main_leader_name: Faker::Name.name,
  sub_leader_name: Faker::Name.name,
  established_at: Faker::Date.between(from: '2008-09-23', to: '2023-09-25')
)

program_1 = church_1.programs.create!(
  name: Faker::ProgrammingLanguage.name,
  date: Faker::Date.between(from: '2008-09-23', to: '2023-09-25'),
  team_id: team_1.id
)

attendance_1 = program_1.create_attendance(
  att_taker: Faker::Name.name,
)



