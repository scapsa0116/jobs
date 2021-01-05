# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
      Jobs.create([{
email: Faker::Internet.email,
phone: Faker::PhoneNumber.phone_number,
adress: Faker::Address.street_address,
title: Faker::Company.name,
service: Faker::Company.industry,
    }])
end

10.times do 
    Cities.create([{
        name: Faker::Address.city,
    }])

end
    
    

    