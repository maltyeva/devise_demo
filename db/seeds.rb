
# test user
User.create!(email: "test@lewagon.com", password: "123123")

10.times do
  User.create!(email: Faker::Internet.email, password: "123123")
end
