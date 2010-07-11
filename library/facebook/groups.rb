if !params["access_token"] 
  @title = "Login needed"
  add_link("Please log in", "https://graph.facebook.com/oauth/authorize?client_id=131137803591593&redirect_uri=http://unlock.blindpages.com/facebook/login")
else
  token = params["access_token"]
  @title = "Groups"
  groups = JSON.parse(open(URI.encode("https://graph.facebook.com/#{params['id']}/groups&access_token=#{token}")).read)["data"]
  groups.each { |group| add_link(group["name"], "http://www.facebook.com/group.php?gid=#{group["id"]}") }
end
