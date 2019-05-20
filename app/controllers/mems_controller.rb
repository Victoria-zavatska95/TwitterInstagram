class MemsController < ApplicationController
def index
	@mems = current_user.mems
end	

def new
	@mem = Mem.new
end

def create
	@mem = current_user.mems.build(memparams)
	if @mem.save
    redirect_to root_path
    else
    render 'new'
end	
end	


private def memparams 
	params.require(:mem).permit(:image)
	end
end
