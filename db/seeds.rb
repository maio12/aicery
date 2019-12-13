# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'


puts 'Cleaning database...'
List.destroy_all
Inventory.destroy_all
Supermarket.destroy_all
Product.destroy_all
Item.destroy_all
User.destroy_all


# product6 = Product.create(name: "Uova Fresche Bio Categoria a 100 Uova Italiane", brand: "Lidl", quantity: 6, unit: 'pz', price: 200)
# product1 = Product.create(name: "Carote", brand: "Eurospin", quantity: 1000, unit: 'g', price: 100)
# product2 = Product.create(name: "Maltagliati 189 Pasta All'uovo", brand: "EasyCoop", quantity: 250, unit: 'g', price: 200)
# product3 = Product.create(name: "Barilla spaghetti integrale", brand: "Barilla", quantity: 400, unit: 'g', price: 139)
# product4 = Product.create(name: "Mirtilli freschi", brand: "Carrefour", quantity: 300, unit: 'g', price: 300)
# product7 = Product.create(name: "Galbani Santa Lucia Tris Mozzarella", brand: "Galbani", quantity: 375, unit: 'g', price: 199)
# product8 = Product.create(name: "Philadelphia Original", brand: "Philadelphia", quantity: 160, unit: 'g', price: 199)
# product9 = Product.create(name: "Parmeggiano Reggiano 18 Mesi", brand: "Carrefour", quantity: 100, unit: 'g', price: 215)
# product10 = Product.create(name: "Vallelata Ricottine Fresche", brand: "Vallelata", quantity: 200, unit: 'g', price: 119)
# product11 = Product.create(name: "Gran Padano 12 Mesi", brand: "Carrefour", quantity: 100, unit: 'g', price: 229)
# product12 = Product.create(name: "Scottilete Classic", brand: "Scottilete", quantity: 400, unit: 'g', price: 259)
# product13 = Product.create(name: "Prosciuto Cotto di Alta Qualita", brand: "Carrefour", quantity: 150, unit: 'g', price: 249)



path = "products.json"
serialized_products = File.read(path)
products = JSON.parse(serialized_products)

products.first(400).each do |row|
  Product.create!(
    name: row["name"],
    price: row["base_price"].to_f * 100,
    brand: row["brand"],
    photo: row["photo"],
    quantity: row["weight"],
    unit: row["unit"]
    )
end

supermarket = Supermarket.create(chain: "Carrefour", name: "Carrefour Porta Venezia", address: "Via Gustavo Modena 8")
supermarket1 = Supermarket.create(chain: "Esselunga", name: "Esselunga Porta Venezia", address: "Viale Piave, 38B")
supermarket2 = Supermarket.create(chain: "U2 Supermercato", name: "U2 Supermercato Porta Venezia", address: "Viale Premuda, 27")


Supermarket.all.each do |supermarket|
  rand(10..20).times do |i|
    percentage = 0
    while percentage == 0
      percentage = rand(-0.2..0.2)
    end
    product = Product.all.sample

    base_price = product.price
    price = (rand(-0.2..0.2) + 1) * base_price

    # base_price * 0.1
    # price

    Inventory.create!(supermarket: supermarket, product: product)
  rescue ActiveRecord::RecordInvalid
    next
  end
end





gregory = User.create(first_name: "Gregory", last_name: "Conti", email: "gregory@conti.com", password: "nailingit")
ginevra = User.create(first_name: "Ginevra", last_name: "Fontes Williams", email: "ginevra@fontes.com", password: "nailingit")
patricio = User.create(first_name: "Patricio", last_name: "Galindo", email: "patricio@galindo.com", password: "nailingit")
antonio = User.create(first_name: "Antonio", last_name: "Maiocchi", email: "antonio@maiocchi.com", password: "nailingit")

list = List.create(user: gregory, name: "my list")
list1 = List.create(user: ginevra, name: "christmas dinner")
list2 = List.create(user: antonio, name: "yoga diet")

item = Item.create(list: list, quantity: 6, bought: false, product: Product.all.sample)
item4 = Item.create(list: list, quantity: 3, bought: false, product: Product.all.sample)
item5 = Item.create(list: list, quantity: 10, bought: false, product: Product.all.sample)
item = Item.create(list: list, quantity: 6, bought: false, product: Product.all.sample)
item = Item.create(list: list, quantity: 6, bought: false, product: Product.all.sample)
item = Item.create(list: list, quantity: 6, bought: false, product: Product.all.sample)
item = Item.create(list: list, quantity: 6, bought: false, product: Product.all.sample)
item = Item.create(list: list, quantity: 6, bought: false, product: Product.all.sample)
item1 = Item.create(list: list1, quantity: 3, bought: false, product: Product.all.sample)
item2 = Item.create(list: list2, quantity: 15, bought: false, product: Product.all.sample)

# inventory = Inventory.create(supermarket: supermarket, product: Product.all.sample)
# inventory1 = Inventory.create(supermarket: supermarket1, product: Product.all.sample)
# inventory2 = Inventory.create(supermarket: supermarket2, product: Product.all.sample)






