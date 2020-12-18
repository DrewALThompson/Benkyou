require 'rails_helper'
RSpec.describe Project, :type => :model do

    let(:user){
        User.create(
            :name => "Mike",
            :password => "password",
            :email => "Mike@mike.com"
        )
    }
    let(:projectwoid){
        Project.create(
            :title => "Hi",
            :content => "This is content"
        )
    }

    it "is invalid without a user id" do
        expect(projectwoid).to be_invalid
    end

end