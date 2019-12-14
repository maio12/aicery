require 'open-uri'
require 'nokogiri'
require 'json'
require 'byebug'


ingredient = ['prosciutto', 'latte', 'uovo', 'pasta', 'formaggio', 'fruta', 'verdura', 'pesce']

products = []

ingredient.each do |ingredient|
  url = "https://www.carrefour.it/ricerca/?isNoF=false&search=#{ingredient}&page=1"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(".c-card").each do |article|
    brand = article.search(".c-card__title_complete").text
    name = article.search(".c-card__description_complete").text.gsub("Carrefour ", "")
    base_price_cents = article.search(".c-cartbtn").attr('data-prezzo').value
    photo = article.search(".c-cartbtn").attr('data-image').value
    weight = article.search(".c-cartbtn").attr('data-peso').value
    unit = article.search(".c-cartbtn").attr('data-unit').value
    product = {
      brand: brand,
      name: name,
      base_price_cents: base_price_cents,
      photo: photo,
      weight: weight,
      unit: unit
    }

    products << product
  end
end

filepath = 'products.json'

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(products))
end
