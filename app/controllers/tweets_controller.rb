class TweetsController < ApplicationController
    PER = 4
  def index
    @tweets = Tweet.order(id: :DESC).page(params[:page]).per(PER)
  end
  
  def new
    @tweet = Tweet.new
  end
 
 def create
   Tweet.create(tweet_params)
   redirect_to action: :index
 end

 def edit
   @tweet = Tweet.find(params[:id])
 end
 
 def update
   @tweet = Tweet.find(params[:id])
   @tweet.update(tweet_params)
   redirect_to action: :index
 end
 
 def destroy
   @tweet = Tweet.find(params[:id])
   @tweet.destroy
   redirect_to action: :index
 end
 
 private
 def tweet_params
   params.require(:tweet).permit(:text).merge(user_id: current_user.id)
 end
 
end
