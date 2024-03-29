require 'rails_helper'

RSpec.describe Follower, type: :model do
  subject{
     build(:follower, user: user)
  }

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "should not be valid without initial_user_id" do
       subject.initial_user_id = nil
       expect(subject).to_not be_valid
    end
    
 context "association" do
    it { should belong_to(:user) }
  end
    
    it { should validate_presence_of(:initial_user_id) }
  end
end