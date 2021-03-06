require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rest-client'

def deputo

def deputes_name
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/regions/(vue)/tableau"))
  first_name = page.css('td:nth-child(2)')
  last_name = page.css('td:nth-child(3)')

  first_names = []
  first_name.each do |link|
    test = link.text
    first_names << test
  end

  last_names = []
  last_name.each do |link|
    test = link.text
    last_names << test
  end

  hash = Hash[last_names.zip(first_names)]
  puts hash.map {|last_names, first_names| {:Nom => last_names, :Prénom => first_names}}
end


#osef de ça, c'est juste pour voir la redirection des liens
def fiche
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/regions/(vue)/tableau"))
  link = page.css('td:nth-child(8) a')
  link.each {|link| puts "http://www2.assemblee-nationale.fr#{link['href']}"}
end
#fiche


def all_email(link)
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{link}"))
  mail = page.css("dd:nth-child(8) > ul > li:nth-child(1) > a")
  contact = page.css("dt:nth-child(7)")
  mail.map{|element| element['href'].delete_prefix("mailto:")}
end


def deputes_email
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/regions/(vue)/tableau"))
  link = page.css('td:nth-child(8) a')
  link.each {|link| puts all_email(link['href'].delete_prefix('.'))}

  d_mail = []
  email.each do |link|
    test = link.text
    d_mail << test
  end

end
deputes_name
deputes_email

end

deputo
