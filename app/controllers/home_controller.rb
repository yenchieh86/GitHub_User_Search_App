class HomeController < ApplicationController
  def index
  end
  
  
  def search
    info = check_user(params[:q])
    
    if info.include?('"message":"Validation Failed"') || info.include?('"total_count":0')
      @user = 0
    else
      user = is_user_in_the_list?(info, params[:q])
      if(user === nil )
        @user = 0
      else
        @user = single_user_info(user)
        @followers = any_follower(@user)
      end
    end
    
    respond_to do |format|
      format.js
    end
  end
  
  private
  
    def check_user(username)
      uri = URI('https://api.github.com/search/users?q=' + username)
      result = Net::HTTP.get(uri)
    end
    
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
    
    def any_follower(user)
      uri = URI('https://api.github.com/users/rjmolesa/followers')
      result = Net::HTTP.get(uri)
      
    end


end
