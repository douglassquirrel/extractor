@title = "Vancouver 2010 - Events"

doc = fetch("http://www.vancouver2010.com/")
nodes = doc.xpath("//ul[@id='nav']/li/ul/li").slice(1..-1)
nodes.each { |node| add_link(node.xpath("a/text()").to_s, "http://www.vancouver2010.com" + node.xpath("a/@href").to_s) }
