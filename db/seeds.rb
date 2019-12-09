# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gregory = User.create(first_name: "Gregory", last_name: "Conti", email: "gregory@conti.com", password: "nailingit")
ginevra = User.create(first_name: "Ginevra", last_name: "Fontes Williams", email: "ginevra@fontes.com", password: "nailingit")
patricio = User.create(first_name: "Patricio", last_name: "Galindo", email: "patricio@galindo.com", password: "nailingit")
antonio = User.create(first_name: "Antonio", last_name: "Maiocchi", email: "antonio@maiocchi.com", password: "nailingit")


supermarket = Supermarket.new(chain: "Carrefour", name: "Carrefour Porta Venezia", address: "Via Gustavo Modena 8")
supermarket1 = Supermarket.new(chain: "Esselunga", name: "Esselunga Porta Venezia", address: "Viale Piave, 38B")
supermarket3 = Supermarket.new(chain: "U2 Supermercato", name: "U2 Supermercato Porta Venezia", address: "Viale Premuda, 27")

list = List.new(user: gregory, name: "my list")
list1 = List.new(user: ginevra, name: "christmas dinner")
list2 = List.new(user: antonio, name: "yoga diet")

item = Item.new(list: list, quantity: 6, bought: false)
item1 = Item.new(list: list1, quantity: 3, bought: false)
item2 = Item.new(list: list2, quantity: 15, bought: false)

inventory = Inventory.new(supermarket: supermarket)
inventory1 = Inventory.new(supermarket: supermarket1)
inventory2 = Inventory.new(supermarket: supermarket2)
