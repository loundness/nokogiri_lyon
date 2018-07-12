#Programme qui va récupérer le cours de toutes les cryptomonnaies, et les enregistrer bien proprement dans une array de hashs.

require 'nokogiri'
require 'open-uri'

@crypto_name
@crypto_price
@crypto_rate

#Chercher nom et cours cryptomonnaie
def crypto
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
      @crypto_name = page.css("a.currency-name-container").map { |name| name.text }
      @crypto_price = page.css("a.price").map { |value| value.text }
      @crypto_rate = page.css("td[data-timespan='1h']").map { |rate| rate.text }
      crypto_hash = @crypto_name.zip(@crypto_price, @crypto_rate)
end

puts crypto
