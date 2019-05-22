require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
   let!(:user) { build(:user, email: "test@gmail.com") }

login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

describe "GET #index" do
    it 'inddex' do
    expect(response).to have_http_status(200)
  end
end

  describe 'GET #write_message_new' do
    it "should find current_user and open form for create message" do
      get :new
      expect(subject.current_user.email).to eq("tester@test.com")
      expect(subject.current_user.email).to_not eq(user.email)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #write_message_create' do
    it "should create message and redirect to index page" do
      post :create, params: {message: {body:"Body", from_user_id:subject.current_user.id, to_user_id:subject.current_user.id}}
      expect(subject.current_user.message.body).to eq("Body")
      expect(response).to redirect_to root_path
    end
  end
  end

  describe 'DELETE #destroy' do
    it "should delete message and redirect to index page" do
 expect{ 
        delete :destroy, :id => @message, :message => {}
     }.to change(Message, :count).by(-1)
     expect(response).to redirect_to root_path
    end
  end

