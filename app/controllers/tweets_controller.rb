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


private def tweetparams 
	params.require(:tweet).permit(:body)
	end
end
