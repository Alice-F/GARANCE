puts 'Destroying'
User.destroy_all
Admin.destroy_all
puts 'Destroying done'

admin_attributes = [
  { email: 'a@test.fr', password: 'plopplop' },
  { email: 'b@test.fr', password: 'plopplop' },
]

puts 'Seeding Admins'
Admin.create! admin_attributes
puts 'Admins done'
