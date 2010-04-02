@title = "Vancouver 2010 - Latest News"

doc = fetch("http://www.vancouver2010.com/")
nodes = doc.xpath("//ul[@class='homeNews']/li/a")
nodes.each { |node| add_link(node.xpath("strong/text()").to_s, "http://www.vancouver2010.com" + node.xpath("@href").to_s) }
