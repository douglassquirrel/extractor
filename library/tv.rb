@title = "UK TV Guide"

doc = fetch("http://uk-tv-guide.com/list/")
nodes = doc.xpath("//div[@class='channel-list']//a[starts-with(@href, '/list/')]")
nodes.each { |node| 
    add_link(node.xpath("text()").to_s, "/tv" + node.xpath("@href").to_s.gsub(%r|/[^/]*/$|, "")) 
}

