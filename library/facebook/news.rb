if !params["access_token"] 
  @title = "Login needed"
  add_link("Please log in", "https://graph.facebook.com/oauth/authorize?client_id=131137803591593&redirect_uri=http://unlock.blindpages.com/facebook/login")
else
  token = params["access_token"]
  @title = "News"
  news = JSON.parse(open(URI.encode("https://graph.facebook.com/#{params['id']}/feed&access_token=#{token}")).read)["data"]
  news.each { |item| @paragraphs << "From: #{item['from']['name']} - #{item['message']}" 
end
