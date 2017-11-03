# ユーザー
User.create!(name:  "yuya nakano",
             email: "yuya777@gmail.jp",
             password:              "yuya777",
             password_confirmation: "yuya777",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "yama-#{n+1}@gmail.jp"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  content2 = Faker::Lorem.sentence(5)
  content3 = Faker::Lorem.sentence(5)  
  users.each { |user| user.microposts.create!(content: content,content2: content2,content3: content3) }
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }