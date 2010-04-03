@title = "UK TV Guide"

doc = fetch("http://uk-tv-guide.com/list/")
nodes = doc.xpath("//div[@class='channel-list']//a[starts-with(@href, '/list/')]")
nodes.each { |node| 
  link = add_link_from node
  link["url"].gsub(%r|/[^/]*/$|, "")
}

