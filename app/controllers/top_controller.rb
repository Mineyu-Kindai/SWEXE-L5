class TopController < ApplicationController

  def main
    render "login_form"
  end
  
  def login
    
    user = User.find_by(uid: params[:uid])
    
    if user != nil and user.authenticate(params[:pass])
      session[:login_uid] = params[:uid]
      redirect_to tweets_path
    else
      render "error", status: 442
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to tweets_path
  end
  
end
