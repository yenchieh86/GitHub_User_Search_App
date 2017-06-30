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
end