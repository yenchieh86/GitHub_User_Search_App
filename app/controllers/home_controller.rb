class HomeController < ApplicationController
  def index
  end
  
  def search
    @user = check_user(params[:q])
    respond_to do |format|
      format.js
    end
  end
  
  private
  
    def check_user(username)
      uri = URI('https://api.github.com/search/users?q=' + username)
      @result = Net::HTTP.get(uri)
    end

end
