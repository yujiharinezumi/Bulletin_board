# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テストユーザーの作成
  User.create!(name: "test",
              email: "test@example.com",
              password: "password",
              password_confirmation: "password",
              )


Category.create([
  {name: "仕事"},
  {name: "勉強"},
  {name: "家族"},
  {name: "恋人"},
  {name: "友達"},
  {name: "遊び"},
  {name: "旅行"},
  {name: "その他"}
])
