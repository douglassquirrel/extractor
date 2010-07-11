if !params["code"]
  @title = "Oops"
  @paragraphs << "Logging in failed for some reason (initial code not supplied by Facebook). Sorry I can't help further."
  add_link("You can try again if you want", "/facebook/home")
else
  token_url = URI.encode("https://graph.facebook.com/oauth/access_token?client_id=131137803591593"\
                                                                    + "&redirect_uri=http://unlock.blindpages.com/facebook/login"\
                                                                    + "&client_secret=5b67e7143dbc06dff39fbdbd52980797"\
                                                                    + "&code=#{params['code']}")
  open(token_url).read =~ /^access_token=(.*)$/
  token = $1
  if !token
    @title = "Oops"
    @paragraphs << "Logging in failed for some reason (access token not supplied by Facebook). Sorry I can't help further."
    add_link("You can try again if you want", "/facebook/home")
  else
    @title = "Login successful"
    add_link("Go to home page", URI.encode("/facebook/home?access_token=#{token}"))
  end
end


