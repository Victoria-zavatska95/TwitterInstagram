class MemsController < ApplicationController
def index
	@mems = current_user.mems.order("id DESC")
end	

def new
	@mem = Mem.new
end

def create
	@mem = current_user.mems.build(memparams)
	if @mem.save
    redirect_to mems_path
    else
    render 'new'
end	
end	

def destroy
	@mem = Mem.find(params[:id])
	@mem.destroy
	redirect_to mems_path
end	


private def memparams 
	params.require(:mem).permit(:image)
	end
end
