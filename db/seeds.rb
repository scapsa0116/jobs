# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#       Job.create([{
# email: Faker::Internet.email,
# phone: Faker::PhoneNumber.phone_number,
# adress: Faker::Address.street_address,
# title: Faker::Company.name,
# service: Faker::Company.industry,
#     }])
# end


    
Category.create([
{name: "Driver"},
{name: "Loyer"},
{name: "Industry"},
{name: "Inginer"},
{name: "Teacher"},
{name: "Agricultor"},
{name: "Finance and Economics"},
{name: "Tax return"},
{name: "Bartender"},
{name: "Seller"},
{name: "Software Development"},
{name: "Consultant"},
{name: "Suplier"},
{name: "Others"},
])
    

# Job.create([{
#     title: "Energ Bank", 
#     category_id: "6", 
#     services: "banking", 
#     phone: "+1 444 345 4565", 
#     email: "energ@gmail.com", 
#     adress: "34532 vasile mahu Orhei"
# }]) 