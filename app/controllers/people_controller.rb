class PeopleController < ApplicationController
  def index
  	@people = User.where("id != ?", current_user.id)
  end

  def show
  end  

  def follow
  	following_save = current_user.followings.build(initial_user_id: params[:id])
    following_save.save
    folower = User.find(params[:id]).followers.build(initial_user_id: current_user.id)
    folower.save
   if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
    redirect_back fallback_location: root_path
  else
    redirect_to people_index_path
  end
  end	

  def my_followers
    @followers = current_user.followers
  end 

  def my_following
    @following = Following.where(user_id: current_user.id)
  end 

  def unfollow
    following = Following.find_by(initial_user_id: params[:id])
    following.destroy
    follower = Follower.find_by(initial_user_id: current_user.id)
     follower.destroy
   if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
    redirect_back fallback_location: root_path
  else
    redirect_to people_index_path
  end
  end	

end
