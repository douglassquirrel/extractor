if !params["access_token"] 
  @title = "Login needed"
  add_link("Please log in", "https://graph.facebook.com/oauth/authorize?client_id=131137803591593&redirect_uri=http://unlock.blindpages.com/facebook/login")
else
  token = params["access_token"]
  @title = "Friends"
  friends = JSON.parse(open(URI.encode("https://graph.facebook.com/me/friends?access_token=#{token}")).read)
  @paragraphs << friends.inspect
end
