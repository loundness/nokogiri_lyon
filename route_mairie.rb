#initialise avec les "require"
require 'nokogiri'
require 'open-uri'

#Méthode qui récupère l'adresse email à partir de l'url d'une mairie
def get_the_email_of_a_townhal_from_its_webpage
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
      mail = page.css('html > body > div > main > section[2] > div > table > tbody > tr[4] > td[2]').text
end

puts get_the_email_of_a_townhal_from_its_webpage

#Méthode qui récupère toutes les url de villes du Val d'Oise
def get_all_the_urls_of_val_doise_townhalls
  result = []
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    links = page.css("a.lientxt").map { |url| url['href']}
end

puts get_all_the_urls_of_val_doise_townhalls

#Combiner les méthodes
