class FollowersController < ApplicationController
  def index
    list = separate_user_from_list("#{params[:follower_link]}?page=#{params[:page_num]}")
    @followers = Array.new
    
    list.each do |info|
      user = {}
      arr = info.split(',')
      arr.each do |prop|
        if prop.include? "login"
          user["login"] = prop.split('":')[1]
        elsif prop.include? "avatar_url"
          user["avatar_url"] = prop.split('":')[1]
        elsif prop.include? "html_url"
          user["html_url"] = prop.split('":')[1]
        end
      end
      user.each_value { |value| value.delete!('"') }
      @followers.push(user)
    end
    
    
    
    respond_to do |format|
      format.js
    end
  end
  
  private
  
    
end
