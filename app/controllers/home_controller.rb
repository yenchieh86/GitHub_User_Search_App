class HomeController < ApplicationController
  def index
  end
  
  def search
    info = JSON.parse(get_element("https://api.github.com/search/users?q=#{params[:q]}"))
    
    if info.has_key?("message") || info["total_count"] === 0
      @user = 0
    else
      for i in 0...(info['items'].length)
        if(info['items'][i]['login'] === params[:q])
          @user = info['items'][i]
          break
        end
      end
      
      if(@user === nil)
        @user = 0
      else
        @user["total_follower"] = get_user_profile_page(params[:q])
        @followers = JSON.parse(get_follower_list("https://api.github.com/users/#{params[:q]}/followers"))
      end
    end
    
    respond_to do |format|
      format.js
    end
  end
end