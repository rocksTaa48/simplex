require 'pg'
require 'faker'

(1..10).each do |id|
  User.create!(
    id:,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'qwerty',
    password_confirmation: 'qwerty',
    phone: Faker::PhoneNumber.cell_phone
  )
end

(1..5).each do |id|
  Category.create!(
    id:,
    title: Faker::Commerce.department,
    body: Faker::Lorem.sentence(word_count: 5)
  )
end

(1..30).each do |id|
  Subcategory.create!(
    id:,
    title: Faker::Commerce.brand,
    category_id: Category.find(rand(1..5)).id
  )
end

(1..100).each do |id|
  Item.create!(
    id:,
    description: Faker::Lorem.sentence(word_count: 30),
    title: Faker::Commerce.product_name,
    user_id: User.find(rand(1..10)).id,
    price: Faker::Commerce.price(range: 15..100),
    quantity: Faker::Commerce.price(range: 2..100),
    subcategory_id: Subcategory.find(rand(1..30)).id
  )
end

