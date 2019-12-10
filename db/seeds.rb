# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
List.destroy_all
Inventory.destroy_all
Supermarket.destroy_all
Product.destroy_all
Item.destroy_all
User.destroy_all


product6 = Product.create(name: "Uova Fresche Bio Categoria a 100 Uova Italiane", brand: "Lidl", quantity: 6, unit: 'pz', price: 200)
product1 = Product.create(name: "Carote", brand: "Eurospin", quantity: 1000, unit: 'g', price: 100)
product2 = Product.create(name: "Maltagliati 189 Pasta All'uovo", brand: "EasyCoop", quantity: 250, unit: 'g', price: 200)
product3 = Product.create(name: "Barilla spaghetti integrale", brand: "Barilla", quantity: 400, unit: 'g', price: 139)
product4 = Product.create(name: "Mirtilli freschi", brand: "Carrefour", quantity: 300, unit: 'g', price: 300)


gregory = User.create(first_name: "Gregory", last_name: "Conti", email: "gregory@conti.com", password: "nailingit")
ginevra = User.create(first_name: "Ginevra", last_name: "Fontes Williams", email: "ginevra@fontes.com", password: "nailingit")
patricio = User.create(first_name: "Patricio", last_name: "Galindo", email: "patricio@galindo.com", password: "nailingit")
antonio = User.create(first_name: "Antonio", last_name: "Maiocchi", email: "antonio@maiocchi.com", password: "nailingit")


supermarket = Supermarket.create(chain: "Carrefour", name: "Carrefour Porta Venezia", address: "Via Gustavo Modena 8")
supermarket1 = Supermarket.create(chain: "Esselunga", name: "Esselunga Porta Venezia", address: "Viale Piave, 38B")
supermarket2 = Supermarket.create(chain: "U2 Supermercato", name: "U2 Supermercato Porta Venezia", address: "Viale Premuda, 27")

list = List.create(user: gregory, name: "my list")
list1 = List.create(user: ginevra, name: "christmas dinner")
list2 = List.create(user: antonio, name: "yoga diet")

item = Item.create(list: list, quantity: 6, bought: false, product: product3)
item1 = Item.create(list: list1, quantity: 3, bought: false, product: product2)
item2 = Item.create(list: list2, quantity: 15, bought: false, product: product4)

inventory = Inventory.create(supermarket: supermarket, product: product3)
inventory1 = Inventory.create(supermarket: supermarket1, product: product2)
inventory2 = Inventory.create(supermarket: supermarket2, product: product4)






