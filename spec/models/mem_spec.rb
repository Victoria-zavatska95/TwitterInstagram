
require 'rails_helper'

RSpec.describe Mem, type: :model do
   let!(:user){create(:user)}

  subject{
     build(:Mem, user: user)
  }

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "should not be valid without image" do
       subject.image = nil
       expect(subject).to_not be_valid
    end
    
 context "association" do
    it { should belong_to(:user) }
  end
    
    it { should validate_presence_of(:image) }
  end
end
