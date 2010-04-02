@title = "Vancouver 2010 - Photos"

descriptions = {
"/img/00/30/38/97189379_38imgGalTh-xc.jpg" => "Olympic flame",
"/img/00/30/38/97189360_40imgGalTh-fj.jpg" => "Inflatable mounties",
"/img/00/30/38/97189475_42imgGalTh-ew.jpg" => "Dancers in front of a Canada banner",
"/img/00/30/38/97189314_44imgGalTh-qa.jpg" => "Stadium packed with people at start of closing ceremonies",
"/img/00/30/38/97189281_46imgGalTh-yP.jpg" => "Stadium lit up with purple light; giant silver rings on stage",
"/img/00/30/38/97189226_50imgGalTh-tN.jpg" => "Two excited visitors at closing ceremonies, wearing Australia T-shirts and grinning"}

doc = fetch("http://www.vancouver2010.com/")
nodes = doc.xpath("//div[@class='hTabSlider pictureSlider']//ul")[0].xpath("li")
nodes.each { |node|
  description = descriptions[node.xpath("a/img/@src").to_s]
  url = "http://www.vancouver2010.com" + node.xpath("a/@href").to_s
  add_link(description, url)
}
