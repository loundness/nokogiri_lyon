#récupérer la liste complète des députés de France, puis de récupérer leurs adresses email.
#stocker dans une array de hashs qui contiennent first_name, last_name, et email.

require 'nokogiri'
require 'open-uri'

#Methode sortir mail
def deputy_scrap_mail(adress)
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{adress}"))
    mail_deputy = page.css("dd a.email").map { |mail| mail['href'].sub("mailto:", "")}
end

#puts deputy_scrap_mail

#Methode sortir url de leur fiche député(e)
def deputy_scrap_url
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    url_deputy = page.css("ul.col3 a")
end

#puts deputy_scrap_name

#Methode globale
def perform
  url_all = deputy_scrap_url #définit une variable = notre seconde méthode
  url_all.each do |url| #sur notre variable pour chaque élément "url" on va :
    puts url.text #afficher le texte de la balise soit le nom du ou de la député(e)
    puts deputy_scrap_mail(url['href']) #on va appliquer la méthode mail sur chaque élément url en spécifiant qu'on veut récupérer l'url en remplaçant le "./" par la première partie de l'url commune à toutes les mairies pour qu'ensuite la méthode mail utilise cette url en paramètre
  end
end

perform
