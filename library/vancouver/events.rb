@title = "Vancouver 2010 - Events"

doc = fetch("http://www.vancouver2010.com/")
nodes = doc.xpath("//ul[@id='nav']/li/ul/li/a").slice(1..-1)
nodes.each { |node| 
  link = add_link_from node
  link["url"] = "http://www.vancouver2010.com" + link["url"]
}
