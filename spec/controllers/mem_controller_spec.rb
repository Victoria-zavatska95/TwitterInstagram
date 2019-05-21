require 'rails_helper'

RSpec.describe MemController, type: :controller do

   let!(:user) { build(:user, email: "test@gmail.com") }

login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe "GET #index" do
    it 'gowno' do
    expect(response).to have_http_status(200)
  end
end

  describe 'GET #new' do
    it "should find current_user and open form for create mem" do
      get :new
      expect(subject.current_user.email).to eq("tester@test.com")
      expect(subject.current_user.email).to_not eq(user.email)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it "should create mem and redirect to index page" do
      post :create, params: {mem: {image:Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/my_image.jpg')), 'image/jpeg')}}
      expect(subject.current_user.tweet.image).to eq("Body")
      expect(response).to redirect_to root_path
    end
  end

  describe 'DELETE #destroy' do
    it "should delete mem and redirect to index page" do
 expect{ 
        delete :destroy, :id => @mem, :mem => {}
     }.to change(Mem, :count).by(-1)
     expect(response).to redirect_to root_path
    end
  end

end

