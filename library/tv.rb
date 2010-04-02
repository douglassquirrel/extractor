@title = "UK TV Guide"

doc = fetch("http://uk-tv-guide.com/list/")
@links += doc.xpath("//div[@class='channel-list']//a[starts-with(@href, '/list/')]").collect { |node| 
    {"url" => node.xpath("@href").to_s.gsub(%r|/[^/]*/$|, ""), "text" => node.xpath("text()").to_s} 
}

