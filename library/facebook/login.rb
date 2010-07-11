if !params["code"]
  @title = "Login failure"
  @paragraphs << "Logging in failed for some reason (access code not supplied by Facebook). Sorry I can't help further."
  add_link("You can try again if you want", "/facebook/home")
else
  @title = "Got code"
  @paragraphs << "Code is #{params['code']}"
end


