if !params["access_token"] 
  @title = "Login needed"
  add_link("Please log in", "https://graph.facebook.com/oauth/authorize?client_id=131137803591593&redirect_uri=http://unlock.blindpages.com/facebook/login")
else
  token = params["access_token"]
  @title = "News"
  news = JSON.parse(open(URI.encode("https://graph.facebook.com/#{params['id']}/feed&access_token=#{token}")).read)["data"]
  news.each do |item| 
    message = "From: <a href='" + URI.encode("/facebook/person?id=#{item['from']['id']}&access_token=#{token}") + "'>#{item['from']['name']}</a>"
    message += " - #{item['message']}"
    if item["link"] 
      message += " <a href='" + URI.encode(item['link']) + "'>#{item['name']}</a>"
    end
    if item["comments"]
      message += "<ul>"
      item["comments"]["data"].each do |comment|
        message += "<li>"
        message += "From: <a href='" + URI.encode("/facebook/person?id=#{comment['from']['id']}&access_token=#{token}") + "'>#{comment['from']['name']}</a>"
        message += " - #{comment['message']}</li>"
      end
      message += "</ul>"
    @paragraphs << message
  end
end
