require 'rails_helper'

RSpec.describe Following, type: :model do
    let!(:user){create(:user)}

  subject{
     build(:following, user_id: user.id, initial_user_id: user.id)
  }

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "should not be valid without user_id" do
       subject.user_id = nil
       expect(subject).to_not be_valid
    end
    
 context "association" do
    it { should belong_to(:user) }
  end
end
    
end
