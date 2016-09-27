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

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}

users = User.order(:created_at).take(6)
50.times do
  micropost_id = Random.rand(50)
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.comments.create!(content: content, micropost_id: micropost_id) }
end
