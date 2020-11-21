puts 'Destroying'
User.destroy_all
Admin.destroy_all
Category.destroy_all
Brand.destroy_all
puts 'Destroying done'

# Admins
puts 'Seeding Admins'
admin_attributes = [
  { email: 'a@test.fr', password: 'plopplop' },
  { email: 'b@test.fr', password: 'plopplop' },
]
Admin.create! admin_attributes
puts 'Admins done'

# Categories
category_attributes = [
  { name: "Robe" },
  { name: "Bonnet" },
]
puts 'Seeding Categories'
Category.create! category_attributes
puts 'Categories done'

# Brands
puts 'Seeding Brands'

cabaia = Brand.new(name: "Cabaia")
cabaia.photo.attach(io: open("https://storage.googleapis.com/garance-photos-dev/cabaia.png"), filename: "cabaia.png")
cabaia.save
sessun = Brand.new(name: "Sessùn", description: "Aujourd’hui, Sessùn distille son univers en prenant soin de créer des boutiques à son image, uniques et raffinées.")
sessun.photo.attach(io: open("https://storage.googleapis.com/garance-photos-dev/sessun.png"), filename: "sessun.png")
sessun.save
puts 'Brands done'
