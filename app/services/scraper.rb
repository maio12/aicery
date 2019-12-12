require "nokogiri"
require "httparty"
require "json"
require "pry"


def scrape_craiglist_antiques(page)
  array = []
  html_content = open("https://www.miaspesa.it/?page=1").read
  doc = Nokogiri::HTML(html_content)
  doc.search('a.text').each_with_index do |element, index|
    array << "#{index + 1}. #{element.text.strip}"
  end
  return array
  # TODO: return an array of Antiques found of Craigslist for this `city`.
end
# class Scraper
#   attr_accessor :parse_page

# def initialize
#   doc = HTTParty.get("https://www.miaspesa.it/?page=1")
#   @parse_page = Nokogiri::HTML(doc)
# end

  # def self.scraping_apartments(id)
  #     url = "https://www.airbnb.com/s/#{city}--#{country}/homes?refinement_paths%5B%5D=%2Fhomes&place_id=ChIJw0rXGxGKJRMRAIE4sppPCQM&source=mc_search_bar&search_type=section_navigation&screen_size=large&adults=1"
  #     response = HTTParty.get(url)
  #     parsed_response = Nokogiri::HTML(response.body)

  #      parsed_response.css("a").each do |element|
  #          el = Nokogiri::HTML(HTTParty.get("https://www.airbnb.com/#{element.attributes["href"].value}"))
  #          el.css("img").each do |image|
  #             p image.attributes["src"].value
  #         end
  #      end
  # end

# def self.api_apartments_address
# url_address = "https://raw.githubusercontent.com/EthanRBrown/rrad/master/addresses-us-100.json"
# response_address = HTTParty.get(url_address)
# array = []
#    hash = JSON.parse(response_address)

#    hash.each do |el|
#     el[1].each do |value|
#       array << [value["address1"] + ", " + value["city"], value["city"]] unless value["address1"].nil? || value["city"].nil?
#         # array << element
#          # if value["address1"].nil?
#          #  array << value
#          #  else
#          #  array << value["address1"]
#          #   end
#         end
#     end
#   return array
# end

# def self.api_apartments_photos
#   array = []
#   url = "https://pixabay.com/api/?key=14524179-07300b37e926a47769c427016&q=apartments+rooms&image_type=photo"
#   response = HTTParty.get(url)
#    response["hits"].each do |pic|
#       array << pic["largeImageURL"]
#     end
#     return array
# end


end
