require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  

let!(:user) {create(:user)}
  let!(:tweet) {create(:tweet, user: user)}

  before :each do
    @tweet = assign(:tweet, [Tweet.create!(body: "body1", user: user),
                            Tweet.create!(body: "body2", user: user)])
    # allow(view).to receive_messages(:will_paginate => nil)
  end

  it "should show a tweet body" do
    render
      expect(@tweets[0].body).to eq('body1')
      expect(rendered).to include 'body1'
  end 

end
