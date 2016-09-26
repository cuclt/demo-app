User.create!(name:  "Cuc Le",
             email: "cuc@gmail.org",
             password: "123456",
             password_confirmation: "123456",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.org"
  password = "123456"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(5)
  content = Faker::Lorem.sentence(150)
  users.each {|user| user.microposts.create!(title: title, content: content)}
end
