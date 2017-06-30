require 'net/http'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def get_element(link)
    uri = URI(link)
    result = Net::HTTP.get(uri)
  end
  
  def separate_user_from_list(link)
    get_element(link).split('},{')
  end
  
  def get_user_profile_page(username)
    uri = URI("https://github.com/#{username}")
    html_data = Net::HTTP.get_response(uri).body
    follower_num = html_data.match(/Follower(.|\n)*?span>/).to_s.match(/>(.|\n)*?</).to_s.delete('> <')
  end
end