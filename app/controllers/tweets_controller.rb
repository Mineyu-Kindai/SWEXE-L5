class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(message: params[:tweet][:message], 
    user_id: 1) #FIXIT: complete correct user_id
    @tweet.save
    redirect_to tweets_path
  end
  
  def destroy
    @Tweet = Tweet.find(params[:id]).destroy
    redirect_to tweets_path
  end
end
