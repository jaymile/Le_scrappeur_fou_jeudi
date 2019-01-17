require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"
page = Nokogiri::HTML(open(PAGE_URL))


def get_townhall_email(townhall_url)
  doc = Nokogiri::HTML(open(townhall_url))
  doc.xpath('//tbody/tr[4]/td[2]').each do |node|
  	  return node.text
  	end
end

def get_townhall_urls(url_ville)
ville = []
doc = Nokogiri::HTML(open(url_ville))
	doc.xpath('//tr[2]//p//a/@href').each do |node|
    ville.push(node.text) #ville.push je fait rentré url dans larray et le(node.text) est la valeur de doc.xpath

	end
  return ville.map { |e| e.gsub('./' , 'https://www.annuaire-des-mairies.com/')  } # ma methode retourne 'ville' mais vue que jai besoin de supprimer le '.' pour avoir une adreese url correct j'utilise gsub pour enlever le point et la methode map pour la boucle qui me permet de suprimer et de le remplacé par le reste du site
end

def emailParVille
i = 0
variable = []
  while i < get_townhall_urls.count

      doc = Nokogiri::HTML(open("#{url_ville[i]}"))
      	doc.xpath('//tr[2]//p//a/@href').map do |node|
          ville.push(node.text) #ville.push je fait rentré url dans larray et le(node.text) est la valeur de doc.xpath

      	end
       variable[i]
       i +=1
  end
end


def perfom
get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")
get_townhall_urls("http://annuaire-des-mairies.com/val-d-oise.html")
p emailParVille
end

perfom

#voyance-par-telephone > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td:nth-child(1) > p > a:nth-child(1)
