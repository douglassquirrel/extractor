if params["access_token"] 
  @title = "Access token is #{params['access_token']}"
else
  @title = "Login needed"
  add_link("Please log in", "https://graph.facebook.com/oauth/authorize?client_id=131137803591593&redirect_uri=http://unlock.blindpages.com/facebook/login")
end
