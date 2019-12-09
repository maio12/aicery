# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
List.destroy_all
Product.destroy_all
Supermarket.destroy_all
Inventory.destroy_all
Item.destroy_all
User.destroy_all


puts 'Creating products...'
Product.create!(
  name: "Uova Fresche Bio Categoria a 100 Uova Italiane",
  brand: "Lidl",
  quantity: 6,
  unit: 'pz',
  price: 200,
  )
end

Product.create!(
  name: "Carote",
  brand: "Eurospin",
  quantity: 1000,
  unit: 'g',
  price: 100
  )
end

Product.create!(
  name: "Maltagliati 189 Pasta All'uovo",
  brand: "EasyCoop",
  quantity: 250,
  unit: 'g',
  price: 200
  )
end

Product.create!(
  name: "Barilla spaghetti integrale",
  brand: "Barilla",
  quantity: 400,
  unit: 'g',
  price: 139
  )
end

Product.create!(
  name: "Mirtilli freschi",
  brand: "Carrefour",
  quantity: 300,
  unit: 'g',
  price: 300
  )
end


puts 'finished!'
