@title = "Vancouver 2010 - Latest News"

doc = fetch("http://www.vancouver2010.com/")
nodes = doc.xpath("//ul[@class='homeNews']/li/a")

nodes.each { |node| 
  link = add_link_from node
  link["url"] = "/vancouver/newsstory?title=" + link["url"].split("/")[-1]
}

add_link("Back to home", "/vancouver")
