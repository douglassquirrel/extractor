doc = fetch("http://www.vancouver2010.com/olympic-news/n/news/" + params["title"])
@title = doc.xpath("//h1/text()").to_s
nodes = doc.xpath("(//div[@class='contentBlock'])[1]/p")
nodes.each { |node| @paragraphs << inner_xml_of(node) }
add_link("Back to news", "/vancouver/news")
