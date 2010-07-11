if !params["access_token"] 
  @title = "Login needed"
  add_link("Please log in", "https://graph.facebook.com/oauth/authorize?client_id=131137803591593"\
                                                                    + "&redirect_uri=http://unlock.blindpages.com/facebook/login"\
                                                                    + "&scope=user_activities,friends_activities,read_stream")
else
  token = params["access_token"]
  profile = JSON.parse(open(URI.encode("https://graph.facebook.com/me")).read)
  add_link("Friends", URI.encode("/facebook/friends?access_token=#{token}"))
  add_link("News", URI.encode("/facebook/news?id=#{profile['id']}&access_token=#{token}"))
end
