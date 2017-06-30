class FollowersController < ApplicationController
  def index
    @next_button = false
    @last_button = false
    @current_page = params[:page_num].to_i
    @link = params[:follower_link]
    @followers = Array.new
    list = separate_user_from_list("#{@link}?page=#{@current_page}")
    
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
    
    @next_button = true if separate_user_from_list("#{@link}?page=#{@current_page + 1}")[0].include?('login')
    @last_button = true if separate_user_from_list("#{@link}?page=#{@current_page - 1}")[0].include?('login')
    
    respond_to do |format|
      format.js
    end
  end
  
  private
  
    
end