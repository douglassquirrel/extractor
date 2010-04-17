EVENTS_LINKS = xpath.that_navigates { to_any_element.with_name("ul")
                                      and_attributes("id" => "nav")
                                      and_then.to_children.with_name("li")
                                      and_then.to_children.with_name("ul")
                                      and_then.to_children.with_name("li")
                                      and_then.to_children.with_name("a") }

@title = "Vancouver 2010 - Events"

doc = fetch("http://www.vancouver2010.com/")
nodes = doc.xpath(EVENTS_LINKS).slice(1..-1)
nodes.each { |node| 
  link = add_link_from node
  link["url"] = "http://www.vancouver2010.com" + link["url"]
}
