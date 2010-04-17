NEWS_LINKS = xpath.that_navigates { to_any_element.with_name("ul")
                                    and_attributes("class" => "homeNews")
                                    and_then.to_children.with_name("li")
                                    and_then.to_children.with_name("a") }

@title = "Vancouver 2010 - Latest News"

doc = fetch("http://www.vancouver2010.com/")
nodes = doc.xpath(NEWS_LINKS)

nodes.each { |node| 
  link = add_link_from node
  link["url"] = "/vancouver/newsstory?title=" + link["url"].split("/")[-1]
}

add_link("Back to home", "/vancouver")
