class HomeController < ApplicationController
  def index
  end
  
  def search
    info = get_element("https://api.github.com/search/users?q=#{params[:q]}")
    
    if info.include?('"message":"Validation Failed"') || info.include?('"total_count":0')
      @user = 0
    else
      user = is_user_in_the_list?(info, params[:q])
      if(user === nil )
        @user = 0
      else
        @user = single_user_info(user)
        @user["total_follower"] = get_user_profile_page(params[:q])
        @followers = separate_user_from_list("https://api.github.com/users/#{@user['login']}/followers")
        
      end
    end
    
    respond_to do |format|
      format.js
    end
  end
  
  private
    
    def is_user_in_the_list?(info, username)
      info.slice(/"login":"#{username}".*?"score".*?}/)
    end
    

    def single_user_info(info)
      userdata = info.chomp('}').split(',')
      
      user = Hash.new
      properties = ['login', 'id', 'avatar_url', 'gravatar_id', 'url',
             'html_url', 'followers_url', 'following_url', 'gists_url',
             'starred_url', 'subscriptions_url', 'organizations_url',
             'repos_url', 'events_url', 'received_events_url', 
             'type', 'site_admin', 'score']
      
      userdata.each_with_index{ |x, i| user[properties[i]] = (x.split('":')[1]) }
      user.map{ |x| x[1].delete!('"')}
      user
    end
end