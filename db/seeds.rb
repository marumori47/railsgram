# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

j = User.create!(name: 'john0123', email: 'j@example.com', password: 'password')
e = User.create!(name: 'emily456', email: 'e@example.com', password: 'password')
a = User.create!(name: 'almin7890', email: 'a@example.com', password: 'password')

3.times do
  j.articles.create!(
    content: Faker::Lorem.sentence(word_count: 3)
  )
end
3.times do
  e.articles.create!(
    content: Faker::Lorem.sentence(word_count: 3)
  )
end
3.times do
  a.articles.create!(
    content: Faker::Lorem.sentence(word_count: 3)
  )
end