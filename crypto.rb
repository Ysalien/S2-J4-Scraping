require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rest-client'

def trader
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  name = page.css('a.currency-name-container.link-secondary')
  price = page.css('a.price')

    names = []
    name.each do |link|
      test = link.text
      names << test
    end

    prices = []
    price.each do |link|
      testo = link.text
      prices << testo
    end

    hash = Hash[names.zip(prices)]
    a = hash.map {|names, prices| {:Name => names, :Price => prices}}
    puts a

end

trader

  #puts names.zip(prices)
