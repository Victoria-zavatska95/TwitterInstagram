class PagesController < ApplicationController
before_action :authenticate_user!

def index
	@followers = Follower.where(user_id: current_user.id)
	@following = Following.where(user_id: current_user.id)
end

end
