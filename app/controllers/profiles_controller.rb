class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(message: params[:profile][:message])
    redirect_to tweets_path
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end
  
  def show
    @profile = Profile.find(params[:id])
  end
  
  
end
