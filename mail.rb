require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rest-client'

#osef de ça c'est juste pour voir la redirection du site
def get_all_the_urls_of_val_doise_townhalls
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  link = page.css("a.lientxt")
  link.each {|link| puts "http://annuaire-des-mairies.com#{link['href'].delete_prefix('.')}"}
end
#get_all_the_urls_of_val_doise_townhalls


def get_the_email_of_a_townhal_from_its_webpage(href)
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{href}"))
  name = page.css('h1')[1].text
  info = page.css('tr.txt-primary.tr-last td')[6].text
  mail = page.css('tr.txt-primary.tr-last td')[7].text
    puts "#{name.capitalize}
#{info} : #{mail}"
end
#get_the_email_of_a_townhal_from_its_webpage

def get_the_email_of_all_townhal_from_webpage
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  link = page.css("a.lientxt")
  link.each {|link| get_the_email_of_a_townhal_from_its_webpage(link['href'].delete_prefix('.'))}
end
get_the_email_of_all_townhal_from_webpage
