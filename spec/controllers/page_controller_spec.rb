require 'rails_helper'

RSpec.describe PageController, type: :controller do

 describe "GET #index" do
    it 'gowno' do
    expect(response).to have_http_status(200)
  end
end
end

