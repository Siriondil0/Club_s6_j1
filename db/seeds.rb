

require'faker'
15.times do
    user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name  , email: Faker::Internet.email, password: "1234")
end