require 'rails_helper'

RSpec.describe Message, type: :model do
   let!(:user){create(:user)}

  subject{
     build(:message, from_user_id: user.id, user_id: user.id)
  }

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "should not be valid without body" do
       subject.body = nil
       expect(subject).to_not be_valid
    end
    
    it { should validate_presence_of(:body) }
  end
end
