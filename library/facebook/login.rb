if !params["code"]
  @title = "Login failure"
  @paragraphs << "Logging in failed for some reason (access code not supplied by Facebook). Sorry I can't help further."
  add_link("You can try again if you want", "/facebook/home")
else
  token_response = open("https://graph.facebook.com/oauth/access_token?client_id=131137803591593&redirect_uri=http://unlock.blindpages.com/facebook/login&client_secret=5b67e7143dbc06dff39fbdbd52980797&code=#{params['code']}").read
  @paragraphs << "Token response was:"
  @paragraphs << token_response
end


