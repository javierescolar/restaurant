# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Profile.create([name: 'Administrator'])
Category.create([name: 'Combo'])
User.create([name: 'Admin',mail:'admin',password: Digest::MD5.hexdigest('admin'),profile_id:1])
Table.create([number:57])
Plate.create([name:'Plato prueba',category_id:1,photo:'potatoes.jpg',price:8.75])
Plate.create([name:'Plato prueba 2',category_id:1,photo:'fingers.jpg',price:7.5])
