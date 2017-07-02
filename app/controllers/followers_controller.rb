class FollowersController < ApplicationController
  def index
    @next_button = false
    @last_button = false
    @current_page = params[:page_num].to_i
    @link = params[:follower_link]
    @followers = JSON.parse(page_num(@current_page))
    next_page_list = JSON.parse(page_num(@current_page + 1))
    
    @next_button = true if next_page_list.length > 0
    @last_button = true if @current_page - 1 > 0
    
    respond_to do |format|
      format.js
    end
  end
  
  private
  
    def page_num(num)
      get_follower_list("#{@link}?page=#{num}")
    end
end