class PeopleController < ApplicationController
  def index
  	@people = User.where("id != ?", current_user.id)
  end

  def follow
  	follower_save = current_user.followers.build(initial_user_id: params[:id])
    follower_save.save
    redirect_to people_path
  end	

  def unfollow
    follower = Follower.find(params[:id])
     follower.destroy
     redirect_to people_path
  end	

end
