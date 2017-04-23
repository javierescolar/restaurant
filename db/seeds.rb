# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Perfiles precargados de la Aplicacion
Profile.create([name: 'Administrator'])#id = 1
Profile.create([name: 'Chef'])#id = 2
Profile.create([name: 'Waiter'])#id = 3

#usuario precargados de la Aplicacion
User.create([
    profile_id:1,
    dni: '00000000A',
    name: 'Admin',
    surnames:'Admin Admin',
    phone_1:666666666,
    mail:'admin@admin.es',
    password: Digest::MD5.hexdigest('admin')
])
