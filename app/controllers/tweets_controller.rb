class TweetsController < ApplicationController
  before_action :login
  
  def index
    @tweets = Tweet.all.order(created_at: :DESC)
  end
  
  def new 
    @tweet = Tweet.new
  end
  
  def create
    @tweet = @user.tweets.build(message: params[:message])
    if @tweet.save
      redirect_to root_path
    else
      render new_tweet_path
    end
  end

  private
  
  def login
    @user = User.find_by(uid: session[:login_uid]) if session[:login_uid]
    
    redirect_to root_path if @user.nil?
  end
end
