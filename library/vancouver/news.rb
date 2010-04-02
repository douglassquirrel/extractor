@title = "Vancouver 2010 - Latest News"

doc = fetch("http://www.vancouver2010.com/")
nodes = doc.xpath("//ul[@class='homeNews']/li/a")

nodes.each { |node| 
  title = node.xpath("strong/text()").to_s
  url = "/vancouver/newsstory?title=" + node.xpath("@href").to_s.split("/")[-1]
  add_link(title, url) 
}

add_link("Back to home", "/vancouver")
