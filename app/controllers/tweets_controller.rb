class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(message: params[:tweet][:message])
    @tweet.user = User.find_by(uid: session[:login_uid])
    @tweet.save
    redirect_to tweets_path
  end
  
  def destroy
    @Tweet = Tweet.find(params[:id]).destroy
    redirect_to tweets_path
  end
end
