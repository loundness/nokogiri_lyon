#initialise avec les "require"
require 'nokogiri'
require 'open-uri'

#Méthode qui récupère l'adresse email à partir de l'url d'une mairie
def get_the_email_of_a_townhal_from_its_webpage(adress)
    page = Nokogiri::HTML(open(adress))
      mail = page.css('html > body > div > main > section[2] > div > table > tbody > tr[4] > td[2]').text
end

#Méthode qui récupère toutes les url de villes du Val d'Oise
def get_all_the_urls_of_val_doise_townhalls
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
      links = page.css("a.lientxt") #.map { |url| url['href'].delete_prefix "." } pas nécéssaire car stocke les urls dans un array difficilement récumérable ensuite pour associer à la méthode mail
end

#Combiner les méthodes
def perform
  url_all = get_all_the_urls_of_val_doise_townhalls #définit une variable = notre seconde méthode
  url_all.each do |url| #sur notre variable pour chaque élément "url" on va :
    puts url.text #afficher le texte de la balise soit le nom de la ville
    puts get_the_email_of_a_townhal_from_its_webpage(url['href'].sub("./", "http://annuaire-des-mairies.com/") ) #on va appliquer la méthode mail sur chaque élément url en spécifiant qu'on veut récupérer l'url en remplaçant le "./" par la première partie de l'url commune à toutes les mairies pour qu'ensuite la méthode mail utilise cette url en paramètre
  end
end

perform
