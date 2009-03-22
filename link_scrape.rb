require 'rubygems'
require 'hpricot'
require 'set'

INPUT='thoughtworks_blogs.html'
OUTPUT='thoughtworks_links.txt'

doc = open(INPUT){|f| Hpricot(f)}
links = doc.search("//a").map{|element| "#{element['href']}\n" }
File.open(OUTPUT, 'w'){|f| f.write(Set.new(links).to_a)}
