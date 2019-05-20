class MessagesController < ApplicationController
def index
	@messages = current_user.messages.order("id DESC")
end	

def write_message_new
	@message = Message.new
	@to_user_id = params[:id]
end

def write_message_create
	@message = current_user.messages.build(messagesparams)
	@message.from_user_id = current_user.id
	@message.to_user_id = params[:id]
    @to_other_user_message = User.find(params[:id]).messages.build(body: params[:body], from_user_id: current_user.id, to_user_id: params[:id])
    @to_other_user_message.save
    if @message.save
    redirect_to messages_path	
end
end

def delete
	@message = Message.find(params[:id])
	@message.destroy
	redirect_to messages_path
end	
private def messagesparams 
	params.require(:message).permit(:body, :from_user_id, :to_user_id)
	end
	
end
