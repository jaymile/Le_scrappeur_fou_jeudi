require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(open(PAGE_URL))


def symbole
  @name= []
  doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  doc.xpath('//tr/td[3]').each do |node|

    @name.push(node.text)
	end
  return @name
end


def price
  @name= []
  doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  doc.xpath('//a[@class="price"]').each do |node|

    @name.push(node.text)
  end
  return @name
end

p symbole
p price
