if !params["access_token"] 
  @title = "Login needed"
  add_link("Please log in", "https://graph.facebook.com/oauth/authorize?client_id=131137803591593&redirect_uri=http://unlock.blindpages.com/facebook/login")
else
  token = URI.decode(params["access_token"])
  @title = "News"
  @paragraphs << "</p><form action='/facebook/news' method='get'><p>" \
                                                  + "<label for='message'>Write a message:</label>" \
                                                  + "<input type='text' id='message' name='message'/>" \
                                                  + "<input type='hidden' id='id' name='id' value='#{params['id']}'/>" \
                                                  + "<input type='hidden' id='access_token' name='access_token' value='" + URI.encode(token) + "'/>" \
                                                  + "<input type='submit' value='Post Message'/></p></form><p>"
  if params["message"]
    open("https://graph.facebook.com/#{params['id']}/feed", :method => :post, \
         :body => "message=#{params['message']}&access_token=#{token}")
    @paragraphs << "Message posted!"
  end
  if params["comment_message"]
#    open("https://graph.facebook.com/#{params['news_item_id']}/comments", :method => :post, \
#         :body => "message=#{params['message']}&access_token=#{token}")
    @paragraphs << "Comment posted! " + "https://graph.facebook.com/#{params['news_item_id']}/comments message=#{params['message']}&access_token=#{token}"
  end    
  news = JSON.parse(open(URI.encode("https://graph.facebook.com/#{params['id']}/feed&access_token=#{token}")).read)["data"]
  news.each do |item| 
    message = "<a href='" + URI.encode("/facebook/person?id=#{item['from']['id']}&access_token=#{token}") + "'>#{item['from']['name']}</a>"
    message += ": #{item['message']}"
    if item["link"] 
      message += " <a href='" + URI.encode(item['link']) + "'>#{item['name']}</a>"
    end
    if item["comments"]
      message += "<ul>"
      item["comments"]["data"].each do |comment|
        message += "<li>"
        message += "<a href='" + URI.encode("/facebook/person?id=#{comment['from']['id']}&access_token=#{token}") + "'>#{comment['from']['name']}</a>"
        message += ": #{comment['message']}</li>"
      end
      message += "</ul>"
    end
    @paragraphs << message
    @paragraphs << "</p><form action='/facebook/news' method='get'><p>" \
                                                  + "<label for='message'>Comment on this message:</label>" \
                                                  + "<input type='text' id='comment_message' name='comment_message'/>" \
                                                  + "<input type='hidden' id='id' name='id' value='#{params['id']}'/>" \
                                                  + "<input type='hidden' id='news_item_id' name='news_item_id' value='#{item['id']}'/>" \
                                                  + "<input type='hidden' id='access_token' name='access_token' value='" + URI.encode(token) + "'/>" \
                                                  + "<input type='submit' value='Post Comment'/></p></form><p>"
  end
end
