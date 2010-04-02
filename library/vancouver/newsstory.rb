doc = fetch("http://www.vancouver2010.com/olympic-news/n/news/" + params["title"])
@title = doc.xpath("//h1/text()").to_s
doc.xpath("//div[@class='contentBlock']")[0].xpath("p/text()").each { |node| @paragraphs << node.to_s }
add_link("Back to news", "/vancouver/news")
