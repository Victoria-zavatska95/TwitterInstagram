require 'rails_helper'

RSpec.describe User, type: :model do
  subject{
  	build(:user)
  }


  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  describe "associations" do
    it { should have_many(:tweets).dependent(:destroy) && should have_many(:tweets).dependent(:destroy) && should have_many(:followers) && should have_many(:followings) && should have_many(:messages) }
  end
end