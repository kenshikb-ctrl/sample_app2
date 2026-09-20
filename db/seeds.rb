# メインのサンプルユーザーを1人作成する
User.find_or_create_by!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "tutorial",
             password_confirmation: "tutorial",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.find_or_create_by!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
