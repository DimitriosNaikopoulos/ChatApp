require 'rails_helper'

RSpec.describe User do
  context 'Is trying to register,' do
    let(:user_info) do
      {
        username: username,
        password: password,
        email: email
      }
    end
    let(:username) {'user1'}
    let(:password) {'pass123'}
    let(:email) {'test@test.com'}
    
    context 'without sufficient information' do
      it "is not valid without any user information" do
        expect(User.new).to_not be_valid
      end
  
      it "is not valid with empty information" do
        expect(User.new({})).to_not be_valid
      end
      
      let(:username) {''}
      it "is invalid wihtout a username" do
        expect(User.new(user_info)).to_not be_valid
      end
    end

    context 'With correct information' do
      it "is able to register successfully" do
        expect(User.new(user_info)).to be_valid
      end
    end
  end
end
