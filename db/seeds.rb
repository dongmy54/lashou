# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 创建求职者
10.times do
  Applicant.create!(
    :address => Faker::Address.full_address,
    :age     => rand(1..80),
    :blog_address => "httpt://exmaple.com/b-rand(1..10)-a",
    :city => Faker::Address.city,
    :education => Applicant::Education.values.sample,
    :email => Faker::Internet.email,
    :mobile => "1" + (Array.new(10) {rand(0..9)}).join(''),
    :name => Faker::Name.unique.name,
    :password => '123456',
    :school => Faker::University.name,
    :sex => Applicant::Sex.values.sample
    )
end
puts '-------------求职者创建完成---------------'



