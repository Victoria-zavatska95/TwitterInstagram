require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  let!(:user) {create(:user)}
  # let!(:profile) {create(:profile, user: user)}

  before :each do
    @tweet = assign(:tweet, [Tweet.create!(body: "body1", user: user),
                            Tweet.create!(body: "body2", user: user)])
    # allow(view).to receive_messages(:will_paginate => nil)
  end

  it "should show a tweet body" do
    render
      expect(@tweet[0].body).to eq('title1')
      expect(rendered).to include 'title1'
  end 

  it "should show a post body" do
    render
    expect(@posts[0].body).to eq('body1')
    expect(rendered).to include 'body1'
  end

  it "should show a link to post title" do
    render
    expect(rendered).to include '<a href="/posts/1">title1</a>'
    expect(rendered).to include '<a href="/posts/2">title2</a>'
  end

  it "should show a link to new photo path" do
    render
    expect(rendered).to include '<a href="/photos/new">New Photo</a>'
  end

  it "should show a link to new post path" do
    render
    expect(rendered).to include '<a href="/posts/new">New Post</a>'
  end

  it "should show a user email" do
    render
    expect(@posts[0].user.email).to eq('tester@test.com')
    expect(rendered).to include 'tester@test.com'
  end

  it "should show a user img" do
    render
    expect(rendered).to include '<img class="rounded-circle" src="/avatar/default.jpeg" alt="Default" width="20" height="20" />'
  end
end
