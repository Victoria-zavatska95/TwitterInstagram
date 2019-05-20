class TweetsController < ApplicationController

def new
	@tweet = Tweet.new
end

def create
	@tweet = current_user.tweets.build(tweetparams)
	if @tweet.save
    redirect_to root_path
    else
    render 'new'
end	
end	

def destroy
	@tweet = Tweet.find(params[:id])
	@tweet.destroy
	redirect_to root_path
end	


private def tweetparams 
	params.require(:tweet).permit(:body)
	end
end
