MEDAL_ROWS = xpath.that_navigates { to_any_element.with_name("div")
                                    and_attributes("id" => "homeMedals")
                                    and_then.to_descendants.with_name("tr") }

@title = "Vancouver 2010 - Medal count"

doc = fetch("http://www.vancouver2010.com/")
rows = doc.xpath(MEDAL_ROWS)
rows.each { |row| 
  country = row.xpath("td[@class='c1']/span/a/text()").to_s
  gold    = row.xpath("td[@class='c2']/text()").to_s
  silver  = row.xpath("td[@class='c3']/text()").to_s
  bronze  = row.xpath("td[@class='c4']/text()").to_s
  total   = row.xpath("td[@class='c5']/text()").to_s
  @paragraphs << "#{country}: #{gold} gold, #{silver} silver, #{bronze} bronze, #{total} total"
}

add_link("Back to home", "/vancouver")
