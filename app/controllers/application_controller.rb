class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_request_from
  
  def set_request_from
    if session[:request_from]
      @request_from = session[:request_from]
    end
    session[:request_from] = request.original_url
  end
  
  def return_back
    if request.referer
      redirect_to :back
      return true
    elsif @request_from
      redirect_to @request_from
      return true
    end
  end
end